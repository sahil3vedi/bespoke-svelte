<script>
	import { cn } from '../../../utils.js';
	import { Dialog as DialogPrimitive } from 'bits-ui';
	import { Button } from '../button/index.js';

	let {
		ref = $bindable(null),
		class: className = '',
		children,
		showCloseButton = false,
		...restProps
	} = $props();
</script>

<div
	bind:this={ref}
	data-slot="dialog-footer"
	class={cn(
		'-mx-4 -mb-4 flex flex-col-reverse gap-2 rounded-b-xl border-t border-foreground/10 bg-muted/30 p-4 sm:flex-row sm:justify-end',
		className
	)}
	{...restProps}
>
	{@render children?.()}
	{#if showCloseButton}
		<DialogPrimitive.Close>
			{#snippet child({ props })}
				<Button variant="outline" {...props}>Close</Button>
			{/snippet}
		</DialogPrimitive.Close>
	{/if}
</div>
