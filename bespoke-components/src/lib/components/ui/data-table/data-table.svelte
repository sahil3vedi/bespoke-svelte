<script>
	import { cn } from '../../../utils.js';
	import { untrack } from 'svelte';
	import { SvelteSet } from 'svelte/reactivity';
	import { Table, TableHeader, TableBody, TableRow, TableHead, TableCell } from '../table/index.js';
	import DataTableToolbar from './data-table-toolbar.svelte';
	import DataTablePagination from './data-table-pagination.svelte';
	import Checkbox from '../checkbox/checkbox.svelte';
	import DropdownMenu from '../dropdown-menu/dropdown-menu.svelte';
	import DropdownMenuTrigger from '../dropdown-menu/dropdown-menu-trigger.svelte';
	import DropdownMenuContent from '../dropdown-menu/dropdown-menu-content.svelte';
	import DropdownMenuLabel from '../dropdown-menu/dropdown-menu-label.svelte';
	import DropdownMenuSeparator from '../dropdown-menu/dropdown-menu-separator.svelte';
	import { ArrowUp, ArrowDown, ArrowUpDown, SlidersHorizontal, ChevronDown } from '@lucide/svelte';

	/**
	 * @typedef {{
	 *   key: string,
	 *   header?: string | import('svelte').Snippet,
	 *   sortable?: boolean,
	 *   cell?: import('svelte').Snippet<[{ value: any, row: any }]>
	 * }} ColumnDef
	 */

	/** @type {{
	 *   columns: ColumnDef[],
	 *   data: Record<string, any>[],
	 *   pageSize?: number,
	 *   searchable?: boolean,
	 *   selectable?: boolean,
	 *   columnToggle?: boolean,
	 *   columnVisibility?: Record<string, boolean>,
	 *   onSelectionChange?: (rows: Record<string, any>[]) => void,
	 *   class?: string,
	 *   toolbar?: import('svelte').Snippet,
	 *   cell?: import('svelte').Snippet<[{ column: ColumnDef, row: Record<string, any>, value: any }]>,
	 *   empty?: import('svelte').Snippet
	 * }} */
	let {
		columns = [],
		data = [],
		pageSize: initialPageSize = 10,
		searchable = true,
		selectable = false,
		columnToggle = false,
		columnVisibility = $bindable({}),
		onSelectionChange,
		class: className = '',
		toolbar: toolbarSnippet,
		cell: cellSnippet,
		empty: emptySnippet,
		...restProps
	} = $props();

	let sortKey = $state('');
	let sortDir = $state(/** @type {'asc' | 'desc'} */ ('asc'));
	let search = $state('');
	let page = $state(1);
	let pageSize = $state(untrack(() => initialPageSize));
	let selectedRows = $state(new SvelteSet());

	$effect(() => {
		// Reset to page 1 on filter/sort change
		search;
		sortKey;
		page = 1;
	});

	const visibleColumns = $derived(columns.filter((col) => columnVisibility[col.key] !== false));

	const filteredData = $derived(
		!search
			? data
			: data.filter((row) =>
					visibleColumns.some((col) =>
						String(row[col.key] ?? '')
							.toLowerCase()
							.includes(search.toLowerCase())
					)
				)
	);

	const sortedData = $derived(
		!sortKey
			? filteredData
			: [...filteredData].sort((a, b) => {
					const av = a[sortKey] ?? '';
					const bv = b[sortKey] ?? '';
					const cmp = String(av).localeCompare(String(bv), undefined, { numeric: true });
					return sortDir === 'asc' ? cmp : -cmp;
				})
	);

	const totalPages = $derived(Math.max(1, Math.ceil(sortedData.length / pageSize)));
	const paginatedData = $derived(sortedData.slice((page - 1) * pageSize, page * pageSize));

	const allSelected = $derived(sortedData.length > 0 && selectedRows.size === sortedData.length);
	const someSelected = $derived(selectedRows.size > 0 && !allSelected);

	/** @param {string} key */
	function toggleSort(key) {
		if (sortKey === key) {
			sortDir = sortDir === 'asc' ? 'desc' : 'asc';
		} else {
			sortKey = key;
			sortDir = 'asc';
		}
	}

	/** @param {Record<string, any>} row */
	function toggleRow(row) {
		const next = new SvelteSet(selectedRows);
		if (next.has(row)) next.delete(row);
		else next.add(row);
		selectedRows = next;
		onSelectionChange?.([...next]);
	}

	function toggleAll() {
		if (allSelected) {
			selectedRows = new SvelteSet();
			onSelectionChange?.([]);
		} else {
			selectedRows = new SvelteSet(sortedData);
			onSelectionChange?.([...sortedData]);
		}
	}

	/** @param {string} key */
	function toggleColumn(key) {
		const isVisible = columnVisibility[key] !== false;
		// Keep at least one column visible.
		if (isVisible && visibleColumns.length <= 1) return;
		columnVisibility = { ...columnVisibility, [key]: !isVisible };
	}

	/** @param {ColumnDef} col */
	function columnLabel(col) {
		return typeof col.header === 'string' ? col.header : col.key;
	}
</script>

<div class={cn('w-full overflow-x-auto', className)} {...restProps}>
	{#if searchable || toolbarSnippet || columnToggle}
		<DataTableToolbar bind:search>
			{#if toolbarSnippet}
				{@render toolbarSnippet()}
			{/if}
			{#if columnToggle}
				<DropdownMenu class="ml-auto">
					<DropdownMenuTrigger
						class="inline-flex items-center gap-1.5 rounded-md border border-input bg-background px-3 py-1.5 text-sm transition-colors hover:bg-muted"
					>
						<SlidersHorizontal class="size-4" />
						Columns
						<ChevronDown class="size-4 opacity-50" />
					</DropdownMenuTrigger>
					<DropdownMenuContent align="end" class="min-w-44">
						<DropdownMenuLabel>Toggle columns</DropdownMenuLabel>
						<DropdownMenuSeparator />
						{#each columns as col (col.key)}
							{@const visible = columnVisibility[col.key] !== false}
							<label
								class="relative flex cursor-pointer items-center gap-2 rounded-sm px-2 py-1.5 text-sm transition-colors select-none hover:bg-accent hover:text-accent-foreground"
							>
								<Checkbox checked={visible} onCheckedChange={() => toggleColumn(col.key)} />
								{columnLabel(col)}
							</label>
						{/each}
					</DropdownMenuContent>
				</DropdownMenu>
			{/if}
		</DataTableToolbar>
	{/if}

	<Table>
		<TableHeader>
			<TableRow>
				{#if selectable}
					<TableHead class="w-10">
						<Checkbox
							checked={allSelected}
							indeterminate={someSelected}
							onCheckedChange={toggleAll}
							class="cursor-pointer"
							aria-label="Select all rows"
						/>
					</TableHead>
				{/if}
				{#each visibleColumns as col (col.key)}
					<TableHead>
						{#if col.sortable !== false && col.key}
							<button
								class="flex items-center gap-1 transition-colors hover:text-foreground {sortKey ===
								col.key
									? 'text-foreground'
									: ''}"
								onclick={() => toggleSort(col.key)}
							>
								{#if typeof col.header === 'string' || col.header === undefined}
									{col.header ?? col.key}
								{:else}
									{@render col.header()}
								{/if}
								{#if sortKey === col.key && sortDir === 'asc'}
									<ArrowUp class="size-3" />
								{:else if sortKey === col.key && sortDir === 'desc'}
									<ArrowDown class="size-3" />
								{:else}
									<ArrowUpDown class="size-3 opacity-40" />
								{/if}
							</button>
						{:else if typeof col.header === 'string' || col.header === undefined}
							{col.header ?? col.key}
						{:else}
							{@render col.header()}
						{/if}
					</TableHead>
				{/each}
			</TableRow>
		</TableHeader>
		<TableBody>
			{#if paginatedData.length === 0}
				<TableRow>
					<TableCell
						colspan={visibleColumns.length + (selectable ? 1 : 0)}
						class="h-24 text-center text-muted-foreground"
					>
						{#if emptySnippet}
							{@render emptySnippet()}
						{:else}
							No results.
						{/if}
					</TableCell>
				</TableRow>
			{:else}
				{#each paginatedData as row (row)}
					{@const isSelected = selectedRows.has(row)}
					<TableRow
						class={isSelected ? 'bg-muted/50' : ''}
						onclick={selectable ? () => toggleRow(row) : undefined}
						style={selectable ? 'cursor: pointer' : undefined}
					>
						{#if selectable}
							<TableCell class="w-10">
								<Checkbox
									checked={isSelected}
									onCheckedChange={() => toggleRow(row)}
									onclick={(e) => e.stopPropagation()}
									class="cursor-pointer"
									aria-label="Select row"
								/>
							</TableCell>
						{/if}
						{#each visibleColumns as col (col.key)}
							<TableCell>
								{#if cellSnippet}
									{@render cellSnippet({ column: col, row, value: row[col.key] })}
								{:else if col.cell}
									{@render col.cell({ row, value: row[col.key] })}
								{:else}
									{row[col.key] ?? ''}
								{/if}
							</TableCell>
						{/each}
					</TableRow>
				{/each}
			{/if}
		</TableBody>
	</Table>

	<DataTablePagination
		bind:page
		bind:pageSize
		{totalPages}
		totalRows={sortedData.length}
		selectedCount={selectedRows.size}
	/>
</div>
