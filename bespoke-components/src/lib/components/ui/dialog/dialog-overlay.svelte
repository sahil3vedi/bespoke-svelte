<script>
	import { Dialog as DialogPrimitive } from 'bits-ui';
	import { cn } from '../../../utils.js';

	let { ref = $bindable(null), class: className = undefined, ...restProps } = $props();
</script>

<DialogPrimitive.Overlay
	bind:ref
	data-slot="dialog-overlay"
	class={cn(
		'data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 fixed inset-0 isolate z-50 bg-black/10 duration-100 supports-backdrop-filter:backdrop-blur-xs',
		className
	)}
	{...restProps}
/>
