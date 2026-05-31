<script lang="ts">
	import { Badge } from '@sahil3vedi/bespoke-components';
</script>

<div class="grid">
	<h1>Badge</h1>

	<!-- Variants -->
	<h2>Variants</h2>
	<p class="mb-4 text-sm text-muted-foreground">
		Use <code>variant</code> to change the badge style.
	</p>
	<div class="mb-6 flex flex-wrap gap-2">
		<Badge>Default</Badge>
		<Badge variant="secondary">Secondary</Badge>
		<Badge variant="destructive">Destructive</Badge>
		<Badge variant="outline">Outline</Badge>
	</div>

	<!-- Usage Examples -->
	<h2>Common Use Cases</h2>

	<h3 class="mt-6">Status Indicators</h3>
	<div class="mb-6 flex flex-wrap gap-2">
		<Badge variant="secondary">Draft</Badge>
		<Badge>Published</Badge>
		<Badge variant="destructive">Archived</Badge>
		<Badge variant="outline">Scheduled</Badge>
	</div>

	<h3>Categories & Tags</h3>
	<div class="mb-6 flex flex-wrap gap-2">
		<Badge variant="secondary">Svelte</Badge>
		<Badge variant="secondary">TypeScript</Badge>
		<Badge variant="secondary">Tailwind</Badge>
		<Badge variant="secondary">Vite</Badge>
	</div>

	<h3>Counters</h3>
	<div class="mb-6 flex flex-wrap gap-4">
		<div class="flex items-center gap-1.5">
			<span class="text-sm">Inbox</span>
			<Badge variant="secondary">12</Badge>
		</div>
		<div class="flex items-center gap-1.5">
			<span class="text-sm">Messages</span>
			<Badge>3 new</Badge>
		</div>
		<div class="flex items-center gap-1.5">
			<span class="text-sm">Errors</span>
			<Badge variant="destructive">5</Badge>
		</div>
	</div>

	<!-- Table Example -->
	<h2>In Tables</h2>
	<p class="mb-4 text-sm text-muted-foreground">
		Badges work well for status columns in data tables.
	</p>
	<div class="mb-6 overflow-x-auto rounded-lg border">
		<table class="w-full text-sm">
			<thead>
				<tr class="border-b bg-muted/50">
					<th class="px-4 py-3 text-left font-medium">Invoice</th>
					<th class="px-4 py-3 text-left font-medium">Status</th>
					<th class="px-4 py-3 text-left font-medium">Amount</th>
				</tr>
			</thead>
			<tbody>
				<tr class="border-b">
					<td class="px-4 py-3">INV-001</td>
					<td class="px-4 py-3"><Badge>Paid</Badge></td>
					<td class="px-4 py-3">$250.00</td>
				</tr>
				<tr class="border-b">
					<td class="px-4 py-3">INV-002</td>
					<td class="px-4 py-3"><Badge variant="secondary">Pending</Badge></td>
					<td class="px-4 py-3">$150.00</td>
				</tr>
				<tr class="border-b">
					<td class="px-4 py-3">INV-003</td>
					<td class="px-4 py-3"><Badge variant="destructive">Overdue</Badge></td>
					<td class="px-4 py-3">$350.00</td>
				</tr>
				<tr>
					<td class="px-4 py-3">INV-004</td>
					<td class="px-4 py-3"><Badge variant="outline">Cancelled</Badge></td>
					<td class="px-4 py-3">$100.00</td>
				</tr>
			</tbody>
		</table>
	</div>

	<!-- Interactive Example -->
	<div class="mt-8 mb-6 rounded-lg border border-border bg-muted p-6 pt-0">
		<h3>Interactive Example</h3>
		<p class="text-muted-foreground">
			Badges are purely presentational — no interactive state needed.
		</p>
		<div class="mt-4 flex flex-wrap gap-2">
			<Badge variant="secondary">variant="secondary"</Badge>
			<Badge>variant="default"</Badge>
			<Badge variant="destructive">variant="destructive"</Badge>
			<Badge variant="outline">variant="outline"</Badge>
		</div>
		<div class="mt-4 text-sm text-muted-foreground">
			<p>
				Import <code>badgeVariants</code> for building custom badge-like elements with
				<code>cn(badgeVariants(&#123; variant: 'secondary' &#125;))</code>.
			</p>
		</div>
	</div>
</div>
