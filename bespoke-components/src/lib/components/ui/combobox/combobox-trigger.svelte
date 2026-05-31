<script>
	import { getContext } from 'svelte';
	import { cn } from '../../../utils.js';
	import { ChevronsUpDown, X } from '@lucide/svelte';

	/** @type {{ placeholder?: string, class?: string, [key: string]: any }} */
	let { placeholder = 'Select...', class: className = '', ...restProps } = $props();

	const ctx = /** @type {{
	 *   open: boolean,
	 *   multiple: boolean,
	 *   selectedLabel: string,
	 *   selectedItems: Array<{ value: string, label: string }>,
	 *   disabled: boolean,
	 *   toggle: () => void,
	 *   removeItem: (v: string) => void
	 * }} */ (getContext('combobox'));
</script>

<button
	type="button"
	role="combobox"
	aria-haspopup="listbox"
	aria-expanded={ctx.open}
	disabled={ctx.disabled}
	onclick={(e) => {
		e.stopPropagation();
		ctx.toggle();
	}}
	class={cn(
		'flex min-h-9 w-full items-center justify-between gap-2 rounded-md border border-input bg-background px-3 py-2 text-sm transition-colors outline-none focus-visible:border-ring focus-visible:ring-3 focus-visible:ring-ring/50 disabled:cursor-not-allowed disabled:opacity-50',
		ctx.open && 'border-ring ring-3 ring-ring/50',
		className
	)}
	{...restProps}
>
	{#if ctx.multiple}
		<span class="flex flex-1 flex-wrap gap-1">
			{#if ctx.selectedItems.length === 0}
				<span class="text-muted-foreground">{placeholder}</span>
			{:else}
				{#each ctx.selectedItems as item (item.value)}
					<span
						class="inline-flex items-center gap-1 rounded bg-accent px-1.5 py-0.5 text-xs text-accent-foreground"
					>
						{item.label}
						<span
							role="button"
							tabindex="0"
							aria-label="Remove {item.label}"
							onclick={(e) => {
								e.stopPropagation();
								ctx.removeItem(item.value);
							}}
							onkeydown={(e) => {
								if (e.key === 'Enter' || e.key === ' ') {
									e.preventDefault();
									e.stopPropagation();
									ctx.removeItem(item.value);
								}
							}}
							class="opacity-60 hover:opacity-100"
						>
							<X class="size-3" />
						</span>
					</span>
				{/each}
			{/if}
		</span>
	{:else}
		<span class={cn('line-clamp-1', !ctx.selectedLabel && 'text-muted-foreground')}>
			{ctx.selectedLabel || placeholder}
		</span>
	{/if}
	<ChevronsUpDown class="size-4 shrink-0 opacity-50" />
</button>
