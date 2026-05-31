<script>
	import { Button } from '$lib/index.js';
	import { ArrowUpRight, GitBranch, CircleFadingArrowUp } from '@lucide/svelte';

	let isLoading = $state(false);
	let loadingText = $state('Submit');

	function simulateLoading() {
		isLoading = true;
		loadingText = 'Processing...';

		// Simulate async operation
		setTimeout(() => {
			isLoading = false;
			loadingText = 'Submit';
		}, 2000);
	}
</script>

<div class="container mx-auto max-w-6xl p-8">
	<h1 class="mb-2 text-3xl font-bold">Button Component Demo</h1>
	<p class="mb-8 text-gray-600">Orange-themed shadcn-svelte button component</p>

	<div class="space-y-12">
		<!-- Variants Section -->
		<section>
			<h2 class="mb-4 text-2xl font-semibold">Variants</h2>
			<div class="grid grid-cols-2 gap-4 md:grid-cols-3 lg:grid-cols-6">
				<Button>Default</Button>
				<Button variant="outline">Outline</Button>
				<Button variant="secondary">Secondary</Button>
				<Button variant="ghost">Ghost</Button>
				<Button variant="destructive">Destructive</Button>
				<Button variant="link">Link</Button>
			</div>
		</section>

		<!-- Sizes Section -->
		<section>
			<h2 class="mb-4 text-2xl font-semibold">Sizes</h2>
			<div class="flex flex-wrap items-center gap-4">
				<Button size="xs">Extra Small</Button>
				<Button size="sm">Small</Button>
				<Button>Default</Button>
				<Button size="lg">Large</Button>
			</div>
			<div class="mt-4 flex flex-wrap items-center gap-4">
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
		</section>

		<!-- With Icons Section -->
		<section>
			<h2 class="mb-4 text-2xl font-semibold">With Icons</h2>
			<div class="flex flex-wrap gap-4">
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
		</section>

		<!-- Disabled State -->
		<section>
			<h2 class="mb-4 text-2xl font-semibold">Disabled State</h2>
			<div class="flex flex-wrap gap-4">
				<Button disabled>Disabled Default</Button>
				<Button variant="outline" disabled>Disabled Outline</Button>
				<Button variant="secondary" disabled>Disabled Secondary</Button>
			</div>
		</section>

		<!-- Loading State -->
		<section>
			<h2 class="mb-4 text-2xl font-semibold">Loading State</h2>
			<div class="grid grid-cols-2 gap-4 md:grid-cols-3">
				<Button loading>Loading Default</Button>
				<Button variant="outline" loading>Loading Outline</Button>
				<Button variant="secondary" loading>Loading Secondary</Button>
				<Button variant="ghost" loading>Loading Ghost</Button>
				<Button variant="destructive" loading>Loading Destructive</Button>
				<Button variant="link" loading>Loading Link</Button>
			</div>
			<div class="mt-4 flex flex-wrap items-center gap-4">
				<Button size="xs" loading>XS Loading</Button>
				<Button size="sm" loading>Small Loading</Button>
				<Button loading>Default Loading</Button>
				<Button size="lg" loading>Large Loading</Button>
			</div>

			<!-- Interactive Loading Example -->
			<div class="mt-8 rounded-lg border border-gray-200 bg-gray-50 p-6">
				<h3 class="mb-3 text-lg font-semibold">Interactive Example</h3>
				<p class="mb-4 text-gray-600">
					Click the button below to simulate an async operation with loading state:
				</p>
				<div class="flex flex-wrap items-center gap-4">
					<Button onclick={simulateLoading} loading={isLoading}>
						{loadingText}
					</Button>
					<div class="text-sm text-gray-500">
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
				<div class="mt-4 text-sm text-gray-500">
					<p>When loading is true, the button:</p>
					<ul class="mt-1 list-inside list-disc space-y-1">
						<li>Shows a spinning loader icon</li>
						<li>Is automatically disabled</li>
						<li>Has <code class="rounded bg-gray-100 px-1 py-0.5">aria-busy="true"</code></li>
						<li>Maintains its variant and size styling</li>
					</ul>
				</div>
			</div>
		</section>

		<!-- Link Button -->
		<section>
			<h2 class="mb-4 text-2xl font-semibold">Link Button</h2>
			<div class="flex flex-wrap gap-4">
				<Button href="/demo">Button as Link</Button>
				<Button variant="outline" href="/demo">Outline as Link</Button>
			</div>
		</section>
	</div>
</div>
