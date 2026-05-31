<script>
	import { onMount } from 'svelte';
	import { LoaderCircle } from '@lucide/svelte';
	import { loadingStore, stopLoading } from './loading.svelte.js';

	const FADE_DURATION = 300;
	let fading = $state(false);
	let visible = $state(true);
	/** @type {ReturnType<typeof setTimeout> | undefined} */
	let hideTimer;

	$effect(() => {
		if (loadingStore.isLoading) {
			clearTimeout(hideTimer);
			visible = true;
			fading = false;
		} else {
			fading = true;
			hideTimer = setTimeout(() => {
				visible = false;
				hideTimer = undefined;
			}, FADE_DURATION);
		}
	});

	onMount(() => {
		stopLoading();
		return () => clearTimeout(hideTimer);
	});
</script>

{#if visible}
	<div
		aria-hidden="true"
		class="fixed inset-0 z-[9999] flex items-center justify-center bg-background transition-opacity duration-300 {fading
			? 'opacity-0'
			: 'opacity-100'}"
	>
		<LoaderCircle class="size-8 animate-spin text-foreground" />
	</div>
{/if}
