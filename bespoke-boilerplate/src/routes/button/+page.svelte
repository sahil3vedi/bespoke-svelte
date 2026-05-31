<script>
	import { Button } from '@sahil3vedi/bespoke-components';
	import { ArrowUpRight, GitBranch, CircleFadingArrowUp } from 'lucide-svelte';

	let isLoading = $state(false);
	let loadingText = $state('Submit');

	function simulateLoading() {
		isLoading = true;
		loadingText = 'Processing...';

		setTimeout(() => {
			isLoading = false;
			loadingText = 'Submit';
		}, 2000);
	}
</script>

<div class="grid">
	<h1>Button</h1>
	<!-- Variants Section -->

	<h2>Variants</h2>
	<div class="mb-6 grid grid-cols-2 gap-4 md:grid-cols-3 lg:grid-cols-6">
		<Button>Default</Button>
		<Button variant="outline">Outline</Button>
		<Button variant="secondary">Secondary</Button>
		<Button variant="ghost">Ghost</Button>
		<Button variant="destructive">Destructive</Button>
		<Button variant="link">Link</Button>
	</div>

	<!-- Sizes Section -->

	<h2>Sizes</h2>
	<div class="flex flex-wrap items-center gap-4">
		<Button size="xs">Extra Small</Button>
		<Button size="sm">Small</Button>
		<Button>Default</Button>
		<Button size="lg">Large</Button>
	</div>
	<div class="mt-4 mb-6 flex flex-wrap items-center gap-4">
		<Button size="icon-xs" aria-label="Extra small icon">
			<ArrowUpRight />
		</Button>
		<Button size="icon-sm" aria-label="Small icon">
			<ArrowUpRight />
		</Button>
		<Button size="icon" aria-label="Default icon">
			<ArrowUpRight />
		</Button>
		<Button size="icon-lg" aria-label="Large icon">
			<ArrowUpRight />
		</Button>
	</div>

	<!-- With Icons Section -->

	<h2>With Icons</h2>
	<div class="mb-6 flex flex-wrap gap-4">
		<Button>
			<ArrowUpRight />
			Button with Icon
		</Button>
		<Button variant="outline" size="sm">
			<GitBranch />
			New Branch
		</Button>
		<Button variant="outline" size="icon" aria-label="Submit">
			<CircleFadingArrowUp />
		</Button>
	</div>

	<!-- Disabled State -->

	<h2>Disabled State</h2>
	<div class="mb-6 flex flex-wrap gap-4">
		<Button disabled>Disabled Default</Button>
		<Button variant="outline" disabled>Disabled Outline</Button>
		<Button variant="secondary" disabled>Disabled Secondary</Button>
	</div>

	<!-- Loading State -->

	<h2>Loading State</h2>
	<div class="grid grid-cols-2 gap-4 md:grid-cols-3">
		<Button loading>Loading Default</Button>
		<Button variant="outline" loading>Loading Outline</Button>
		<Button variant="secondary" loading>Loading Secondary</Button>
		<Button variant="ghost" loading>Loading Ghost</Button>
		<Button variant="destructive" loading>Loading Destructive</Button>
		<Button variant="link" loading>Loading Link</Button>
	</div>
	<div class="mt-4 mb-6 flex flex-wrap items-center gap-4">
		<Button size="xs" loading>XS Loading</Button>
		<Button size="sm" loading>Small Loading</Button>
		<Button loading>Default Loading</Button>
		<Button size="lg" loading>Large Loading</Button>
	</div>

	<!-- Interactive Loading Example -->
	<div class="mt-8 mb-6 rounded-lg border border-border bg-muted p-6 pt-0">
		<h3>Interactive Example</h3>
		<p class="text-muted-foreground">
			Click the button below to simulate an async operation with loading state:
		</p>
		<div class="flex flex-wrap items-center gap-4">
			<Button onclick={simulateLoading} loading={isLoading}>
				{loadingText}
			</Button>
			<div class="text-sm text-muted-foreground">
				{#if isLoading}
					<span class="flex items-center gap-2">
						<span class="inline-block h-2 w-2 animate-pulse rounded-full bg-orange-500"></span>
						Simulating async operation (2 seconds)...
					</span>
				{:else}
					Ready to simulate loading
				{/if}
			</div>
		</div>
		<div class="mt-4 text-sm text-muted-foreground">
			<p>When loading is true, the button:</p>
			<ul class="mt-1 list-inside list-disc space-y-1">
				<li>Shows a spinning loader icon</li>
				<li>Is automatically disabled</li>
				<li>
					Has <code class="rounded bg-background px-1 py-0.5 text-foreground">aria-busy="true"</code
					>
				</li>
				<li>Maintains its variant and size styling</li>
			</ul>
		</div>
	</div>

	<!-- Link Button -->

	<h2>Link Button</h2>
	<div class="mb-6 flex flex-wrap gap-4">
		<Button href="/">Button as Link</Button>
		<Button variant="outline" href="/">Outline as Link</Button>
	</div>
</div>
