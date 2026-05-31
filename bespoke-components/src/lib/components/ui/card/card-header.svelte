<script>
	import { cn } from '../../../utils.js';
	let { ref = $bindable(null), class: className = '', children, ...restProps } = $props();
</script>

<div
	bind:this={ref}
	data-slot="card-header"
	class={cn(
		'group/card-header @container/card-header grid auto-rows-min items-start gap-1 rounded-t-xl px-4 group-data-[size=sm]/card:px-3 has-data-[slot=card-action]:grid-cols-[1fr_auto] has-data-[slot=card-description]:grid-rows-[auto_auto] [.border-b]:border-border/50 [.border-b]:pb-4 group-data-[size=sm]/card:[.border-b]:pb-3',
		className
	)}
	{...restProps}
>
	{@render children?.()}
</div>
