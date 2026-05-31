<script>
	import { cn } from '../../../utils.js';
	import { Search, X } from '@lucide/svelte';

	/** @type {{
	 *   search?: string,
	 *   placeholder?: string,
	 *   children?: import('svelte').Snippet,
	 *   class?: string
	 * }} */
	let { search = $bindable(''), placeholder = 'Search...', children, class: className } = $props();
</script>

<div class={cn('flex items-center gap-2 py-3', className)}>
	<div class="relative w-full max-w-sm">
		<Search
			class="pointer-events-none absolute top-1/2 left-2.5 size-4 -translate-y-1/2 text-muted-foreground"
		/>
		<input
			type="text"
			bind:value={search}
			{placeholder}
			class="w-full rounded-md border border-input bg-background py-1.5 pr-8 pl-8 text-sm placeholder:text-muted-foreground focus:ring-2 focus:ring-ring focus:outline-none"
		/>
		{#if search}
			<button
				onclick={() => (search = '')}
				class="absolute top-1/2 right-2.5 -translate-y-1/2 text-muted-foreground hover:text-foreground"
				aria-label="Clear search"
			>
				<X class="size-3.5" />
			</button>
		{/if}
	</div>
	{#if children}
		{@render children()}
	{/if}
</div>
