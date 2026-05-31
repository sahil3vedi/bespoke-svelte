<script lang="ts">
	import { Skeleton, Card, CardHeader, CardContent } from 'bespoke-components';
</script>

<div class="grid">
	<h1>Skeleton</h1>

	<!-- Basic -->
	<h2>Basic</h2>
	<p class="mb-4 text-sm text-muted-foreground">
		Placeholder for loading content. Animates with a pulse.
	</p>
	<div class="mb-6 flex flex-wrap gap-4">
		<Skeleton class="h-10 w-40 basis-full sm:basis-auto" />
		<Skeleton class="h-4 w-60 basis-full sm:basis-auto" />
		<Skeleton class="size-12 rounded-full" />
	</div>

	<!-- Card Skeleton -->
	<h2>Card Skeleton</h2>
	<p class="mb-4 text-sm text-muted-foreground">Mimics a card layout while content loads.</p>
	<div class="mb-6 max-w-sm">
		<Card>
			<CardHeader>
				<Skeleton class="mb-2 h-5 w-32" />
				<Skeleton class="h-4 w-48" />
			</CardHeader>
			<CardContent class="grid gap-3">
				<Skeleton class="h-4 w-full" />
				<Skeleton class="h-4 w-full" />
				<Skeleton class="h-4 w-3/4" />
			</CardContent>
		</Card>
	</div>

	<!-- List Skeleton -->
	<h2>List Skeleton</h2>
	<p class="mb-4 text-sm text-muted-foreground">List loading placeholder with avatars.</p>
	<div class="mb-6 max-w-sm space-y-3">
		{#each [0, 1, 2, 3] as i (i)}
			<div class="flex items-center gap-3">
				<Skeleton class="size-10 rounded-full" />
				<div class="flex-1 space-y-2">
					<Skeleton class="h-4 w-32" />
					<Skeleton class="h-3 w-24" />
				</div>
			</div>
		{/each}
	</div>

	<!-- Table Skeleton -->
	<h2>Table Skeleton</h2>
	<p class="mb-4 text-sm text-muted-foreground">Skeleton rows for table loading states.</p>
	<div class="mb-6 overflow-x-auto">
		<div class="max-w-md space-y-2">
			<div class="flex gap-4">
				<Skeleton class="h-4 w-20" />
				<Skeleton class="h-4 w-24" />
				<Skeleton class="h-4 w-16" />
				<Skeleton class="h-4 w-24" />
			</div>
			{#each [0, 1, 2, 3] as i (i)}
				<div class="flex gap-4">
					<Skeleton class="h-4 w-20" />
					<Skeleton class="h-4 w-24" />
					<Skeleton class="h-4 w-16" />
					<Skeleton class="h-4 w-24" />
				</div>
			{/each}
		</div>
	</div>

	<!-- Interactive Example -->
	<div class="mt-8 mb-6 rounded-lg border border-border bg-muted p-6 pt-0">
		<h3>Usage Notes</h3>
		<div class="mt-4 space-y-2 text-sm text-muted-foreground">
			<p>
				<code>Skeleton</code> renders a <code>&lt;div&gt;</code> with pulse animation and muted background.
			</p>
			<ul class="mt-1 list-inside list-disc space-y-1">
				<li>
					Apply <code>class</code> to control dimensions:
					<code class="rounded bg-background px-1 py-0.5 text-foreground">h-4 w-40</code>
				</li>
				<li>
					Use <code class="rounded bg-background px-1 py-0.5 text-foreground">rounded-full</code> for
					circle avatars
				</li>
				<li>Compose multiple skeletons to mirror your actual layout</li>
				<li>Replace with real content once data loads</li>
			</ul>
		</div>
	</div>
</div>
