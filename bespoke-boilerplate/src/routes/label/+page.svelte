<script lang="ts">
	import { Label, Input, Checkbox, Switch } from '@sahil3vedi/bespoke-components';

	let checked = $state(false);
	let switched = $state(false);
</script>

<div class="grid">
	<h1>Label</h1>

	<!-- Basic -->
	<h2>Basic</h2>
	<p class="mb-4 text-sm text-muted-foreground">
		Renders an accessible <code>&lt;label&gt;</code> element.
	</p>
	<div class="mb-6">
		<Label for="p1-lb-name">Name</Label>
	</div>

	<!-- With Input -->
	<h2>With Input</h2>
	<p class="mb-4 text-sm text-muted-foreground">
		Use <code>for</code> attribute to associate with form controls.
	</p>
	<div class="mb-6 grid max-w-sm gap-2">
		<Label for="p1-lb-email">Email address</Label>
		<Input id="p1-lb-email" type="email" placeholder="you@example.com" />
	</div>

	<!-- With Checkbox -->
	<h2>With Checkbox</h2>
	<div class="mb-6 flex items-center gap-2">
		<Checkbox id="p1-lb-terms" />
		<Label for="p1-lb-terms">Accept terms and conditions</Label>
	</div>

	<!-- With Switch -->
	<h2>With Switch</h2>
	<div class="mb-6 flex items-center gap-2">
		<Switch id="p1-lb-airplane" />
		<Label for="p1-lb-airplane">Airplane mode</Label>
	</div>

	<!-- Interactive Example -->
	<div class="mt-8 mb-6 rounded-lg border border-border bg-muted p-6 pt-0">
		<h3>Interactive Example</h3>
		<p class="text-muted-foreground">Labels improve accessibility and increase click targets.</p>
		<div class="grid max-w-sm gap-4">
			<div class="grid gap-2">
				<Label for="p1-ie-name">Full name</Label>
				<Input id="p1-ie-name" placeholder="Jane Smith" />
			</div>
			<div class="flex items-center gap-2">
				<Checkbox id="p1-ie-newsletter" bind:checked />
				<Label for="p1-ie-newsletter">
					Subscribe to newsletter
					{#if checked}
						<span class="ml-1 text-xs text-muted-foreground">✓ Subscribed</span>
					{/if}
				</Label>
			</div>
			<div class="flex items-center gap-2">
				<Switch id="p1-ie-notifications" bind:checked={switched} />
				<Label for="p1-ie-notifications">
					Push notifications
					{#if switched}
						<span class="ml-1 inline-block h-2 w-2 animate-pulse rounded-full bg-green-500"></span>
					{/if}
				</Label>
			</div>
		</div>
	</div>
</div>
