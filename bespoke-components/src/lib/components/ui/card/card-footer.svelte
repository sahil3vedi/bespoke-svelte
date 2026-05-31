<script>
	import { cn } from '../../../utils.js';
	let { ref = $bindable(null), class: className = '', children, ...restProps } = $props();
</script>

<div
	bind:this={ref}
	data-slot="card-footer"
	class={cn(
		'flex items-center rounded-b-xl border-t border-border/50 bg-muted/50 p-4 group-data-[size=sm]/card:p-3',
		className
	)}
	{...restProps}
>
	{@render children?.()}
</div>
