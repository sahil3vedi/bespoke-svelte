<script lang="ts">
	import { Checkbox, Label } from 'bespoke-components';

	let accepted = $state(false);
	let fruits: string[] = $state([]);
</script>

<div class="grid">
	<h1>Checkbox</h1>

	<!-- Basic -->
	<h2>Basic</h2>
	<p class="mb-4 text-sm text-muted-foreground">
		A control that allows the user to toggle between checked and unchecked.
	</p>
	<div class="mb-6 flex items-center gap-2">
		<Checkbox id="p1-terms" />
		<Label for="p1-terms">Accept terms and conditions</Label>
	</div>

	<!-- Disabled -->
	<h2>Disabled</h2>
	<div class="mb-6 flex flex-wrap gap-6">
		<div class="flex items-center gap-2">
			<Checkbox id="p1-dis-unchecked" disabled />
			<Label for="p1-dis-unchecked">Disabled unchecked</Label>
		</div>
		<div class="flex items-center gap-2">
			<Checkbox id="p1-dis-checked" disabled checked />
			<Label for="p1-dis-checked">Disabled checked</Label>
		</div>
	</div>

	<!-- Multi-select -->
	<h2>Multi-select</h2>
	<p class="mb-4 text-sm text-muted-foreground">
		Use multiple checkboxes for selecting from a list.
	</p>
	<div class="mb-6 grid gap-3">
		{#each ['Apple', 'Banana', 'Blueberry', 'Grapes', 'Pineapple'] as fruit (fruit)}
			<div class="flex items-center gap-2">
				<Checkbox
					id={`p1-fruit-${fruit}`}
					bind:checked={
						() => fruits.includes(fruit),
						(v) => {
							if (v) fruits.push(fruit);
							else fruits.splice(fruits.indexOf(fruit), 1);
						}
					}
				/>
				<Label for={`p1-fruit-${fruit}`}>{fruit}</Label>
			</div>
		{/each}
		<p class="text-sm text-muted-foreground">
			Selected: <code class="rounded bg-background px-1 py-0.5">{fruits.join(', ') || 'none'}</code>
		</p>
	</div>

	<!-- Interactive Example -->
	<div class="mt-8 mb-6 rounded-lg border border-border bg-muted p-6 pt-0">
		<h3>Interactive Example</h3>
		<p class="text-muted-foreground">
			Bind to <code>checked</code> with <code>$state</code>:
		</p>
		<div class="flex items-center gap-3">
			<Checkbox id="p1-ie-accept" bind:checked={accepted} />
			<Label for="p1-ie-accept">
				I agree to the terms
				{#if accepted}
					<span class="ml-1 inline-block h-2 w-2 rounded-full bg-green-500"></span>
				{/if}
			</Label>
		</div>
		<div class="mt-4 text-sm text-muted-foreground">
			<p>
				State: <code class="rounded bg-background px-1 py-0.5"
					>{accepted ? 'checked' : 'unchecked'}</code
				>
			</p>
			<ul class="mt-1 list-inside list-disc space-y-1">
				<li>Click the checkbox or the label text to toggle</li>
				<li>
					Keyboard: <kbd class="rounded border border-border px-1 text-xs">Space</kbd> or
					<kbd class="rounded border border-border px-1 text-xs">Enter</kbd> to toggle
				</li>
			</ul>
		</div>
	</div>
</div>
