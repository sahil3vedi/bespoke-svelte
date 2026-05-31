<script>
	import './layout.css';
	import { BespokeLayout } from '$lib/index.js';
	import { House } from '@lucide/svelte';

	const { children } = $props();

	const sidebarItems = [{ label: 'Home', icon: House, path: '/' }];
</script>

<BespokeLayout title="Bespoke" {sidebarItems}>
	{@render children()}
</BespokeLayout>
