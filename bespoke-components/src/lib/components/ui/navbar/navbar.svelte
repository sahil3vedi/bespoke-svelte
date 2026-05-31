<script>
	import { cn } from '../../../utils.js';
	import { ChevronRight, ChevronLeft } from '@lucide/svelte';

	/** @type {{
	 *   class?: string,
	 *   title?: string,
       sidebarCollapsed: boolean,
	 *   children?: import('svelte').Snippet,
	 *   toggleSidebarCollapse: () => void
	 * }} */
	let {
		class: className = '',
		title = '',
		children,
		sidebarCollapsed,
		toggleSidebarCollapse
	} = $props();
</script>

<nav
	data-slot="navbar"
	class={cn(
		'absolute top-0 right-0 left-0 z-50 flex h-12 items-center gap-2 border-b border-border bg-background px-5 text-foreground',
		className
	)}
>
	<button
		type="button"
		data-slot="navbar-sidebar-trigger"
		aria-label="Toggle sidebar"
		class="inline-flex size-8 items-center justify-center rounded-lg transition-colors hover:bg-muted"
		onclick={toggleSidebarCollapse}
	>
		{#if sidebarCollapsed}
			<ChevronRight class="size-4" />
		{:else}
			<ChevronLeft class="size-4" />
		{/if}
	</button>
	{#if title}
		<span class="text-sm font-medium">{title}</span>
	{/if}
	<div class="ml-auto flex items-center gap-2">
		{@render children?.()}
	</div>
</nav>
