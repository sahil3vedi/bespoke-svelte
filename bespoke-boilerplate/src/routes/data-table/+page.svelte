<script lang="ts">
	import { DataTable, Button } from '@sahil3vedi/bespoke-components';

	// --- Basic demo data ---
	const people = [
		{
			id: 1,
			name: 'Alice Johnson',
			email: 'alice@example.com',
			role: 'Admin',
			status: 'Active',
			joined: '2024-01-15'
		},
		{
			id: 2,
			name: 'Bob Smith',
			email: 'bob@example.com',
			role: 'Editor',
			status: 'Active',
			joined: '2024-02-03'
		},
		{
			id: 3,
			name: 'Carol White',
			email: 'carol@example.com',
			role: 'Viewer',
			status: 'Inactive',
			joined: '2024-03-20'
		},
		{
			id: 4,
			name: 'David Lee',
			email: 'david@example.com',
			role: 'Editor',
			status: 'Active',
			joined: '2024-04-01'
		},
		{
			id: 5,
			name: 'Eva Martinez',
			email: 'eva@example.com',
			role: 'Admin',
			status: 'Active',
			joined: '2024-04-18'
		},
		{
			id: 6,
			name: 'Frank Chen',
			email: 'frank@example.com',
			role: 'Viewer',
			status: 'Inactive',
			joined: '2024-05-10'
		},
		{
			id: 7,
			name: 'Grace Kim',
			email: 'grace@example.com',
			role: 'Editor',
			status: 'Active',
			joined: '2024-06-01'
		},
		{
			id: 8,
			name: 'Henry Brown',
			email: 'henry@example.com',
			role: 'Viewer',
			status: 'Active',
			joined: '2024-06-22'
		},
		{
			id: 9,
			name: 'Iris Patel',
			email: 'iris@example.com',
			role: 'Admin',
			status: 'Active',
			joined: '2024-07-04'
		},
		{
			id: 10,
			name: 'Jack Wilson',
			email: 'jack@example.com',
			role: 'Editor',
			status: 'Inactive',
			joined: '2024-07-19'
		},
		{
			id: 11,
			name: 'Karen Taylor',
			email: 'karen@example.com',
			role: 'Viewer',
			status: 'Active',
			joined: '2024-08-05'
		},
		{
			id: 12,
			name: 'Liam Davis',
			email: 'liam@example.com',
			role: 'Editor',
			status: 'Active',
			joined: '2024-08-30'
		}
	];

	// --- Orders demo data ---
	const orders = [
		{ id: 'ORD-001', product: 'Laptop Pro 16"', amount: 2499.0, qty: 1, status: 'Shipped' },
		{ id: 'ORD-002', product: 'Wireless Mouse', amount: 49.99, qty: 3, status: 'Delivered' },
		{ id: 'ORD-003', product: 'USB-C Hub', amount: 79.99, qty: 2, status: 'Processing' },
		{ id: 'ORD-004', product: 'Monitor 27"', amount: 599.0, qty: 1, status: 'Shipped' },
		{ id: 'ORD-005', product: 'Mechanical Keyboard', amount: 149.99, qty: 1, status: 'Cancelled' },
		{ id: 'ORD-006', product: 'Webcam HD', amount: 89.99, qty: 2, status: 'Delivered' },
		{ id: 'ORD-007', product: 'Desk Mat XL', amount: 39.99, qty: 4, status: 'Processing' }
	];

	// --- Column definitions ---

	// Basic columns — no custom cells, just key/header
	const basicColumns = [
		{ key: 'name', header: 'Name' },
		{ key: 'email', header: 'Email' },
		{ key: 'role', header: 'Role' },
		{ key: 'joined', header: 'Joined' }
	];

	// Columns with custom cell snippets stored per-column
	const richColumns = [
		{ key: 'name', header: 'Name', cell: nameCell },
		{ key: 'email', header: 'Email' },
		{ key: 'role', header: 'Role', cell: roleCell },
		{ key: 'status', header: 'Status', cell: statusCell },
		{ key: 'actions', header: '', sortable: false, cell: actionsCell }
	];

	// Order columns
	const orderColumns = [
		{ key: 'id', header: 'Order' },
		{ key: 'product', header: 'Product' },
		{ key: 'qty', header: 'Qty' },
		{ key: 'amount', header: 'Amount', cell: amountCell },
		{ key: 'status', header: 'Status', cell: orderStatusCell }
	];

	let selected: string[] = $state([]);

	// --- Column visibility demo ---
	const visibilityColumns = [
		{ key: 'name', header: 'Name' },
		{ key: 'email', header: 'Email' },
		{ key: 'role', header: 'Role' },
		{ key: 'status', header: 'Status' },
		{ key: 'joined', header: 'Joined' }
	];

	let columnVisibility: Record<string, boolean> = $state({});

	const statusColors: Record<string, string> = {
		Active: 'bg-green-100 text-green-700 dark:bg-green-900/30 dark:text-green-400',
		Inactive: 'bg-slate-100 text-slate-600 dark:bg-slate-800 dark:text-slate-400'
	};

	const orderStatusColors: Record<string, string> = {
		Delivered: 'bg-green-100 text-green-700 dark:bg-green-900/30 dark:text-green-400',
		Shipped: 'bg-blue-100 text-blue-700 dark:bg-blue-900/30 dark:text-blue-400',
		Processing: 'bg-yellow-100 text-yellow-700 dark:bg-yellow-900/30 dark:text-yellow-400',
		Cancelled: 'bg-red-100 text-red-700 dark:bg-red-900/30 dark:text-red-400'
	};

	const roleColors: Record<string, string> = {
		Admin: 'bg-orange-100 text-orange-700 dark:bg-orange-900/30 dark:text-orange-400',
		Editor: 'bg-purple-100 text-purple-700 dark:bg-purple-900/30 dark:text-purple-400',
		Viewer: 'bg-slate-100 text-slate-600 dark:bg-slate-800 dark:text-slate-400'
	};
</script>

{#snippet nameCell({ value, row }: { value: string; row: Record<string, unknown> })}
	<div class="flex items-center gap-3">
		<div
			class="flex size-8 shrink-0 items-center justify-center rounded-full bg-muted text-xs font-semibold"
		>
			{String(value)[0]}
		</div>
		<div>
			<p class="font-medium">{value}</p>
			<p class="text-xs text-muted-foreground">#{row.id}</p>
		</div>
	</div>
{/snippet}

{#snippet roleCell({ value }: { value: string })}
	<span class="rounded-full px-2 py-0.5 text-xs font-medium {roleColors[value] ?? ''}">
		{value}
	</span>
{/snippet}

{#snippet statusCell({ value }: { value: string })}
	<span class="rounded-full px-2 py-0.5 text-xs font-medium {statusColors[value] ?? ''}">
		{value}
	</span>
{/snippet}

{#snippet actionsCell({ row }: { row: Record<string, unknown> })}
	<div class="flex justify-end gap-1">
		<Button variant="ghost" size="xs" onclick={() => alert(`Edit ${row.name}`)}>Edit</Button>
		<Button variant="ghost" size="xs" onclick={() => alert(`Delete ${row.name}`)}>Delete</Button>
	</div>
{/snippet}

{#snippet amountCell({ value }: { value: number })}
	<span class="font-medium tabular-nums">${Number(value).toFixed(2)}</span>
{/snippet}

{#snippet orderStatusCell({ value }: { value: string })}
	<span class="rounded-full px-2 py-0.5 text-xs font-medium {orderStatusColors[value] ?? ''}">
		{value}
	</span>
{/snippet}

<div class="grid">
	<h1>DataTable</h1>

	<!-- Basic -->
	<h2>Basic</h2>
	<p class="mb-4 text-sm text-muted-foreground">
		Sorting and global search out of the box. Pass <code>columns</code> and <code>data</code>.
	</p>
	<DataTable columns={basicColumns} data={people} />

	<!-- Custom cells -->
	<h2 class="mt-10">Custom Cells &amp; Actions</h2>
	<p class="mb-4 text-sm text-muted-foreground">
		Column definitions accept a <code>cell</code> snippet for custom rendering.
	</p>
	<DataTable columns={richColumns} data={people} pageSize={5} />

	<!-- Row selection -->
	<h2 class="mt-10">Row Selection</h2>
	<p class="mb-4 text-sm text-muted-foreground">
		Enable <code>selectable</code> and wire up <code>onSelectionChange</code>.
	</p>
	<DataTable
		columns={basicColumns}
		data={people}
		pageSize={5}
		selectable
		onSelectionChange={(rows: Record<string, unknown>[]) =>
			(selected = rows.map((r) => String(r.name)))}
	/>
	{#if selected.length > 0}
		<p class="mt-2 text-sm text-muted-foreground">Selected: {selected.join(', ')}</p>
	{/if}

	<!-- Orders with no search -->
	<h2 class="mt-10">Without Search Bar</h2>
	<p class="mb-4 text-sm text-muted-foreground">
		Set <code>searchable={false}</code> to hide the toolbar.
	</p>
	<DataTable columns={orderColumns} data={orders} searchable={false} />

	<!-- Column visibility -->
	<h2 class="mt-10">Column Visibility</h2>
	<p class="mb-4 text-sm text-muted-foreground">
		Pass <code>columnToggle</code> for a built-in checkbox dropdown to show/hide columns. Bind
		<code>columnVisibility</code> to read or control the state.
	</p>
	<DataTable
		columns={visibilityColumns}
		data={people}
		pageSize={5}
		columnToggle
		bind:columnVisibility
	/>

	<!-- Empty state -->
	<h2 class="mt-10">Empty State</h2>
	<p class="mb-4 text-sm text-muted-foreground">
		Custom <code>empty</code> snippet when no rows match.
	</p>
	<DataTable columns={basicColumns} data={[]} searchable={false}>
		{#snippet empty()}
			<div class="flex flex-col items-center gap-1 py-4">
				<p class="font-medium">No users found</p>
				<p class="text-xs text-muted-foreground">Add a user to get started.</p>
			</div>
		{/snippet}
	</DataTable>
</div>
