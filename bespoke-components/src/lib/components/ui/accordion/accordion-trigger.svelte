<script>
	import { getContext } from 'svelte';
	import { cn } from '../../../utils.js';
	import { ChevronDown } from '@lucide/svelte';

	/** @type {{
	 *   children?: import('svelte').Snippet,
	 *   class?: string,
	 *   [key: string]: any
	 * }} */
	let { children, class: className = '', ...restProps } = $props();

	const accordion = /** @type {{ isOpen: (v: string) => boolean, toggle: (v: string) => void }} */ (
		getContext('accordion')
	);
	const item = /** @type {{ value: string, disabled: boolean }} */ (getContext('accordion-item'));

	const open = $derived(accordion.isOpen(item.value));
</script>

<div class="flex">
	<button
		type="button"
		aria-expanded={open}
		disabled={item.disabled}
		onclick={() => accordion.toggle(item.value)}
		class={cn(
			'flex flex-1 items-center justify-between py-4 text-sm font-medium transition-all hover:underline disabled:pointer-events-none disabled:opacity-50 [&[aria-expanded=true]>svg]:rotate-180',
			className
		)}
		{...restProps}
	>
		{@render children?.()}
		<ChevronDown class="size-4 shrink-0 text-muted-foreground transition-transform duration-200" />
	</button>
</div>
