<script>
	import { getContext, onMount, onDestroy } from 'svelte';
	import { cn } from '../../../utils.js';
	import { Check } from '@lucide/svelte';

	/** @type {{
	 *   children?: import('svelte').Snippet,
	 *   class?: string,
	 *   value: string,
	 *   label?: string,
	 *   disabled?: boolean,
	 *   [key: string]: any
	 * }} */
	let { children, class: className = '', value, label, disabled = false, ...restProps } = $props();

	const ctx = /** @type {{
	 *   value: string | string[],
	 *   multiple: boolean,
	 *   filter: string,
	 *   selectItem: (v: string, label: string) => void,
	 *   registerItem: (item: { value: string, label: string }) => void,
	 *   unregisterItem: (v: string) => void
	 * }} */ (getContext('combobox'));

	const resolvedLabel = $derived(label ?? value);
	const selected = $derived(
		ctx.multiple ? /** @type {string[]} */ (ctx.value).includes(value) : ctx.value === value
	);
	const visible = $derived(
		!ctx.filter || resolvedLabel.toLowerCase().includes(ctx.filter.toLowerCase())
	);

	onMount(() => ctx.registerItem({ value, label: resolvedLabel }));
	onDestroy(() => ctx.unregisterItem(value));
</script>

{#if visible}
	<div
		role="option"
		aria-selected={selected}
		aria-disabled={disabled}
		tabindex={disabled ? -1 : 0}
		onclick={() => {
			if (disabled) return;
			ctx.selectItem(value, resolvedLabel);
		}}
		onkeydown={(e) => {
			if (disabled) return;
			if (e.key === 'Enter' || e.key === ' ') {
				e.preventDefault();
				ctx.selectItem(value, resolvedLabel);
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
{/if}
