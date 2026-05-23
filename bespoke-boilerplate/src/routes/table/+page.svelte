<script>
	import {
		Table,
		TableHeader,
		TableBody,
		TableFooter,
		TableRow,
		TableHead,
		TableCell,
		TableCaption
	} from 'bespoke-components';

	const invoices = [
		{ invoice: 'INV-001', status: 'Paid', method: 'Credit Card', amount: '$250.00' },
		{ invoice: 'INV-002', status: 'Pending', method: 'PayPal', amount: '$150.00' },
		{ invoice: 'INV-003', status: 'Unpaid', method: 'Bank Transfer', amount: '$350.00' },
		{ invoice: 'INV-004', status: 'Paid', method: 'Credit Card', amount: '$450.00' },
		{ invoice: 'INV-005', status: 'Paid', method: 'PayPal', amount: '$550.00' }
	];

	/** @type {Record<string, string>} */
	const statusClass = {
		Paid: 'text-green-600 dark:text-green-400',
		Pending: 'text-yellow-600 dark:text-yellow-400',
		Unpaid: 'text-red-600 dark:text-red-400'
	};

	const users = [
		{ name: 'Alice Johnson', email: 'alice@example.com', role: 'Admin', joined: 'Jan 2024' },
		{ name: 'Bob Smith', email: 'bob@example.com', role: 'Editor', joined: 'Feb 2024' },
		{ name: 'Carol White', email: 'carol@example.com', role: 'Viewer', joined: 'Mar 2024' }
	];
</script>

<div class="grid">
	<h1>Table</h1>

	<!-- Basic -->
	<h2>Basic</h2>
	<div class="mb-6 overflow-x-auto">
		<Table>
			<TableHeader>
				<TableRow>
					<TableHead>Invoice</TableHead>
					<TableHead>Status</TableHead>
					<TableHead>Method</TableHead>
					<TableHead class="text-right">Amount</TableHead>
				</TableRow>
			</TableHeader>
			<TableBody>
				{#each invoices as inv (inv.invoice)}
					<TableRow>
						<TableCell class="font-medium">{inv.invoice}</TableCell>
						<TableCell>{inv.status}</TableCell>
						<TableCell>{inv.method}</TableCell>
						<TableCell class="text-right">{inv.amount}</TableCell>
					</TableRow>
				{/each}
			</TableBody>
		</Table>
	</div>

	<!-- With Footer -->
	<h2>With Footer</h2>
	<div class="mb-6 overflow-x-auto">
		<Table>
			<TableHeader>
				<TableRow>
					<TableHead>Invoice</TableHead>
					<TableHead>Status</TableHead>
					<TableHead>Method</TableHead>
					<TableHead class="text-right">Amount</TableHead>
				</TableRow>
			</TableHeader>
			<TableBody>
				{#each invoices as inv (inv.invoice)}
					<TableRow>
						<TableCell class="font-medium">{inv.invoice}</TableCell>
						<TableCell>{inv.status}</TableCell>
						<TableCell>{inv.method}</TableCell>
						<TableCell class="text-right">{inv.amount}</TableCell>
					</TableRow>
				{/each}
			</TableBody>
			<TableFooter>
				<TableRow>
					<TableCell colspan={3}>Total</TableCell>
					<TableCell class="text-right">$1,750.00</TableCell>
				</TableRow>
			</TableFooter>
		</Table>
	</div>

	<!-- With Caption -->
	<h2>With Caption</h2>
	<div class="mb-6 overflow-x-auto">
		<Table>
			<TableCaption>A list of recent invoices.</TableCaption>
			<TableHeader>
				<TableRow>
					<TableHead>Invoice</TableHead>
					<TableHead>Status</TableHead>
					<TableHead>Method</TableHead>
					<TableHead class="text-right">Amount</TableHead>
				</TableRow>
			</TableHeader>
			<TableBody>
				{#each invoices as inv (inv.invoice)}
					<TableRow>
						<TableCell class="font-medium">{inv.invoice}</TableCell>
						<TableCell class={statusClass[inv.status]}>{inv.status}</TableCell>
						<TableCell>{inv.method}</TableCell>
						<TableCell class="text-right">{inv.amount}</TableCell>
					</TableRow>
				{/each}
			</TableBody>
		</Table>
	</div>

	<!-- Custom Cell Content -->
	<h2>Custom Cell Content</h2>
	<div class="mb-6 overflow-x-auto">
		<Table>
			<TableHeader>
				<TableRow>
					<TableHead>Name</TableHead>
					<TableHead>Email</TableHead>
					<TableHead>Role</TableHead>
					<TableHead>Joined</TableHead>
				</TableRow>
			</TableHeader>
			<TableBody>
				{#each users as user (user.email)}
					<TableRow>
						<TableCell>
							<div class="flex items-center gap-3">
								<div
									class="flex size-8 shrink-0 items-center justify-center rounded-full bg-muted text-xs font-medium"
								>
									{user.name[0]}
								</div>
								<span class="font-medium">{user.name}</span>
							</div>
						</TableCell>
						<TableCell class="text-muted-foreground">{user.email}</TableCell>
						<TableCell>
							<span
								class="rounded-full bg-secondary px-2 py-0.5 text-xs font-medium text-secondary-foreground"
							>
								{user.role}
							</span>
						</TableCell>
						<TableCell class="text-muted-foreground">{user.joined}</TableCell>
					</TableRow>
				{/each}
			</TableBody>
		</Table>
	</div>
</div>
