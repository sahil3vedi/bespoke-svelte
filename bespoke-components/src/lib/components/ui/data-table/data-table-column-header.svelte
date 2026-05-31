<script>
	import { cn } from '../../../utils.js';
	import { ArrowUp, ArrowDown, ArrowUpDown } from '@lucide/svelte';

	/** @type {{
	 *   label?: string,
	 *   sortKey?: string,
	 *   columnKey?: string,
	 *   sortDir?: 'asc' | 'desc',
	 *   onSort?: (key: string) => void,
	 *   class?: string,
	 *   children?: import('svelte').Snippet
	 * }} */
	let {
		label,
		sortKey = '',
		columnKey = '',
		sortDir = 'asc',
		onSort,
		class: className = '',
		children
	} = $props();

	const isSorted = $derived(sortKey === columnKey && columnKey !== '');
</script>

<button
	class={cn(
		'flex items-center gap-1 transition-colors hover:text-foreground',
		isSorted ? 'text-foreground' : 'text-muted-foreground',
		className
	)}
	onclick={() => columnKey && onSort?.(columnKey)}
>
	{#if children}
		{@render children()}
	{:else}
		{label}
	{/if}
	{#if isSorted && sortDir === 'asc'}
		<ArrowUp class="size-3" />
	{:else if isSorted && sortDir === 'desc'}
		<ArrowDown class="size-3" />
	{:else}
		<ArrowUpDown class="size-3 opacity-40" />
	{/if}
</button>
