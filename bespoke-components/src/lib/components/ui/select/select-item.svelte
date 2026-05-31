<script>
	import { getContext } from 'svelte';
	import { cn } from '../../../utils.js';
	import { Check } from '@lucide/svelte';

	/** @type {{
	 *   children?: import('svelte').Snippet,
	 *   class?: string,
	 *   value: string,
	 *   disabled?: boolean,
	 *   [key: string]: any
	 * }} */
	let { children, class: className = '', value, disabled = false, ...restProps } = $props();

	const ctx = /** @type {{ value: string, selectItem: (v: string, label: string) => void }} */ (
		getContext('select')
	);

	const selected = $derived(ctx.value === value);

	/** @param {HTMLElement} node */
	function getTextContent(node) {
		return node.textContent?.trim() ?? value;
	}

	/** @type {HTMLDivElement | undefined} */
	let itemEl = $state();
</script>

<div
	bind:this={itemEl}
	role="option"
	aria-selected={selected}
	aria-disabled={disabled}
	tabindex={disabled ? -1 : 0}
	onclick={() => {
		if (disabled) return;
		ctx.selectItem(value, itemEl ? getTextContent(itemEl) : value);
	}}
	onkeydown={(e) => {
		if (disabled) return;
		if (e.key === 'Enter' || e.key === ' ') {
			e.preventDefault();
			ctx.selectItem(value, itemEl ? getTextContent(itemEl) : value);
		}
	}}
	class={cn(
		'relative flex w-full cursor-pointer items-center rounded-sm py-1.5 pr-2 pl-8 text-sm transition-colors outline-none select-none hover:bg-accent hover:text-accent-foreground focus:bg-accent focus:text-accent-foreground',
		disabled && 'pointer-events-none opacity-50',
		className
	)}
	{...restProps}
>
	<span class="absolute left-2 flex size-3.5 items-center justify-center">
		{#if selected}
			<Check class="size-4" />
		{/if}
	</span>
	{@render children?.()}
</div>
