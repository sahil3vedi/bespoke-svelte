<script>
	import { cn } from '../../../utils.js';
	import { ChevronLeft, ChevronRight, ChevronsLeft, ChevronsRight } from 'lucide-svelte';
	import { Button } from '../button/index.js';

	/** @type {{
	 *   page?: number,
	 *   pageSize?: number,
	 *   totalPages: number,
	 *   totalRows: number,
	 *   selectedCount?: number,
	 *   showPageSizeSelector?: boolean,
	 *   class?: string
	 * }} */
	let {
		page = $bindable(1),
		pageSize = $bindable(10),
		totalPages,
		totalRows,
		selectedCount = 0,
		showPageSizeSelector = true,
		class: className
	} = $props();

	const pageSizes = [10, 20, 30, 50];
	const start = $derived((page - 1) * pageSize + 1);
	const end = $derived(Math.min(page * pageSize, totalRows));
</script>

<div class={cn('flex items-center justify-between border-t border-border/50 px-1 py-3', className)}>
	<p class="text-sm text-muted-foreground">
		{#if selectedCount > 0}
			{selectedCount} of {totalRows} row(s) selected
		{:else}
			{totalRows === 0 ? 0 : start}–{end} of {totalRows} row(s)
		{/if}
	</p>

	<div class="flex items-center gap-4">
		{#if showPageSizeSelector}
			<div class="flex items-center gap-2 text-sm">
				<span class="text-muted-foreground">Rows per page</span>
				<select
					value={pageSize}
					onchange={(e) => {
						pageSize = Number(/** @type {HTMLSelectElement} */ (e.target).value);
						page = 1;
					}}
					class="rounded border border-input bg-background py-1 pr-8 pl-2 text-sm"
				>
					{#each pageSizes as size (size)}
						<option value={size}>{size}</option>
					{/each}
				</select>
			</div>
		{/if}

		<span class="text-sm text-muted-foreground">Page {page} of {totalPages}</span>

		<div class="flex items-center gap-1">
			<Button
				variant="outline"
				size="icon-sm"
				onclick={() => (page = 1)}
				disabled={page <= 1}
				aria-label="First page"
			>
				<ChevronsLeft class="size-4" />
			</Button>
			<Button
				variant="outline"
				size="icon-sm"
				onclick={() => page--}
				disabled={page <= 1}
				aria-label="Previous page"
			>
				<ChevronLeft class="size-4" />
			</Button>
			<Button
				variant="outline"
				size="icon-sm"
				onclick={() => page++}
				disabled={page >= totalPages}
				aria-label="Next page"
			>
				<ChevronRight class="size-4" />
			</Button>
			<Button
				variant="outline"
				size="icon-sm"
				onclick={() => (page = totalPages)}
				disabled={page >= totalPages}
				aria-label="Last page"
			>
				<ChevronsRight class="size-4" />
			</Button>
		</div>
	</div>
</div>
