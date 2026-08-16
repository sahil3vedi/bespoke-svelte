<script>
	import Navbar from '../navbar/navbar.svelte';
	import Sidebar from '../sidebar/sidebar.svelte';
	import PageContainer from '../page-container/page-container.svelte';
	import Loader from '../loader/loader.svelte';
	import { afterNavigate } from '$app/navigation';

	/** @type {HTMLDivElement | null} */
	let scrollContainer = $state(null);

	afterNavigate(() => {
		scrollContainer?.scrollTo(0, 0);
	});

	/** @type {{
	 *   sidebarItems: Array<import('../../../types.js').SidebarItem>,
	 *   title?: string,
	 *   children?: import('svelte').Snippet,
	 *   navbarEnd?: import('svelte').Snippet
	 * }} */
	let { sidebarItems, title = '', children, navbarEnd } = $props();

	let collapsed = $state(true);
	let maskVisible = $state(false);
	/** @type {ReturnType<typeof setTimeout> | undefined} */
	let pendingToggle;

	const toggleCollapsed = () => {
		if (pendingToggle !== undefined) {
			clearTimeout(pendingToggle);
			pendingToggle = undefined;
		}
		if (collapsed) {
			maskVisible = true;
			collapsed = false;
			pendingToggle = undefined;
		} else {
			collapsed = true;
			pendingToggle = setTimeout(() => {
				maskVisible = false;
				pendingToggle = undefined;
			}, 150);
		}
	};
</script>

{#snippet navbarChildren()}
	{@render navbarEnd?.()}
{/snippet}

<Loader />
<div class="relative h-screen overflow-hidden">
	<Navbar
		{title}
		sidebarCollapsed={collapsed}
		toggleSidebarCollapse={toggleCollapsed}
		children={navbarChildren}
	/>
	<Sidebar {sidebarItems} {collapsed} />
	<div
		role="button"
		tabindex={0}
		aria-label="Close sidebar"
		inert={!maskVisible || undefined}
		class="absolute top-12 right-0 bottom-0 left-0 z-30 backdrop-blur-sm {maskVisible
			? 'pointer-events-auto opacity-100'
			: 'pointer-events-none opacity-0'}"
		onclick={toggleCollapsed}
		onkeydown={(e) => (e.key === 'Enter' || e.key === ' ') && toggleCollapsed()}
	></div>
	<div
		bind:this={scrollContainer}
		class="absolute top-12 right-0 bottom-0 left-0 overflow-y-auto"
	>
		<PageContainer>
			{@render children?.()}
		</PageContainer>
	</div>
</div>
