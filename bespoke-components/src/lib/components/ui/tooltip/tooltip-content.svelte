<script>
	import { Tooltip as TooltipPrimitive } from 'bits-ui';
	import { cn } from '../../../utils.js';

	let {
		ref = $bindable(null),
		class: className = '',
		sideOffset = 0,
		side = /** @type {'top' | 'bottom' | 'right' | 'left'} */ ('top'),
		...restProps
	} = $props();
</script>

<TooltipPrimitive.Content
	bind:ref
	data-slot="tooltip-content"
	{sideOffset}
	{side}
	class={cn(
		'data-open:animate-in data-open:fade-in-0 data-open:zoom-in-95 data-[state=delayed-open]:animate-in data-[state=delayed-open]:fade-in-0 data-[state=delayed-open]:zoom-in-95 data-closed:animate-out data-closed:fade-out-0 data-closed:zoom-out-95 data-[side=bottom]:slide-in-from-top-2 data-[side=left]:slide-in-from-right-2 data-[side=right]:slide-in-from-left-2 data-[side=top]:slide-in-from-bottom-2 z-50 inline-flex w-fit max-w-xs origin-(--bits-tooltip-content-transform-origin) items-center gap-1.5 rounded-md bg-foreground px-3 py-1.5 text-xs text-background has-data-[slot=kbd]:pr-1.5 **:data-[slot=kbd]:relative **:data-[slot=kbd]:isolate **:data-[slot=kbd]:z-50 **:data-[slot=kbd]:rounded-sm',
		className
	)}
	{...restProps}
/>
