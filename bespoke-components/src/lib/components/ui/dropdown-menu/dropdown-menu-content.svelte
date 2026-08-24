<script>
	import { getContext } from 'svelte';
	import { cn } from '../../../utils.js';

	/** @type {{
	 *   children?: import('svelte').Snippet,
	 *   class?: string,
	 *   align?: 'start' | 'end' | 'center',
	 *   side?: 'top' | 'bottom',
	 *   [key: string]: any
	 * }} */
	let {
		children,
		class: className = '',
		align = 'start',
		side = 'bottom',
		...restProps
	} = $props();

	const ctx = /** @type {{ open: boolean, toggle: () => void, close: () => void }} */ (
		getContext('dropdown')
	);

	const alignClass = { start: 'left-0', center: 'left-1/2 -translate-x-1/2', end: 'right-0' };
	const sideClass = { bottom: 'top-full mt-1', top: 'bottom-full mb-1' };
</script>

{#if ctx.open}
	<div
		role="menu"
		onclick={(e) => e.stopPropagation()}
		class={cn(
			'absolute z-50 min-w-[8rem] overflow-hidden rounded-md border border-border bg-popover p-1 text-popover-foreground shadow-md',
			alignClass[align],
			sideClass[side],
			className
		)}
		{...restProps}
	>
		{@render children?.()}
	</div>
{/if}
