<script>
	import { getContext, tick } from 'svelte';
	import { cn } from '../../../utils.js';
	import { Search } from '@lucide/svelte';

	/** @type {{ children?: import('svelte').Snippet, class?: string, placeholder?: string, [key: string]: any }} */
	let { children, class: className = '', placeholder = 'Search...', ...restProps } = $props();

	const ctx = /** @type {{ open: boolean, filter: string, setFilter: (q: string) => void }} */ (
		getContext('combobox')
	);

	/** @type {HTMLInputElement | undefined} */
	let inputEl = $state();

	$effect(() => {
		if (ctx.open) {
			tick().then(() => inputEl?.focus());
		}
	});
</script>

{#if ctx.open}
	<div
		role="listbox"
		onclick={(e) => e.stopPropagation()}
		class={cn(
			'absolute top-full z-50 mt-1 w-full overflow-hidden rounded-md border border-border bg-popover text-popover-foreground shadow-md',
			className
		)}
		{...restProps}
	>
		<div
			class="flex items-center border-b border-border px-3 focus-within:ring-0 focus-within:outline-none"
		>
			<Search class="mr-2 size-4 shrink-0 opacity-50" />
			<input
				bind:this={inputEl}
				type="text"
				role="searchbox"
				aria-label="Search"
				autocomplete="off"
				value={ctx.filter}
				oninput={(e) => ctx.setFilter(/** @type {HTMLInputElement} */ (e.target).value)}
				{placeholder}
				class="flex h-9 w-full border-0 bg-transparent py-2 text-sm ring-0 outline-none placeholder:text-muted-foreground focus:border-0 focus:ring-0 focus:[box-shadow:none] focus:outline-none disabled:cursor-not-allowed disabled:opacity-50"
			/>
		</div>
		<div class="max-h-60 overflow-x-hidden overflow-y-auto p-1">
			{@render children?.()}
		</div>
	</div>
{/if}
