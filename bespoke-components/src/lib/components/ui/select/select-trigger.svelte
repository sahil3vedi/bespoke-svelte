<script>
	import { getContext } from 'svelte';
	import { cn } from '../../../utils.js';
	import { ChevronDown } from '@lucide/svelte';

	/** @type {{ children?: import('svelte').Snippet, class?: string, [key: string]: any }} */
	let { children, class: className = '', ...restProps } = $props();

	const ctx = /** @type {{ open: boolean, disabled: boolean, toggle: () => void }} */ (
		getContext('select')
	);
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
		'flex h-9 w-full items-center justify-between rounded-md border border-input bg-background px-3 py-2 text-sm transition-colors outline-none focus-visible:border-ring focus-visible:ring-3 focus-visible:ring-ring/50 disabled:cursor-not-allowed disabled:opacity-50 [&>span]:line-clamp-1',
		ctx.open && 'border-ring ring-3 ring-ring/50',
		className
	)}
	{...restProps}
>
	{@render children?.()}
	<ChevronDown
		class={cn('size-4 shrink-0 opacity-50 transition-transform', ctx.open && 'rotate-180')}
	/>
</button>
