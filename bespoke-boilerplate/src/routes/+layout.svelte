<script lang="ts">
	import './layout.css';
	import favicon from '$lib/assets/favicon.svg';
	import { BespokeLayout } from '@sahil3vedi/bespoke-components';
	import {
		House,
		ArrowDown,
		ChevronDown,
		ListFilter,
		Search,
		Table2,
		LayoutList,
		ChevronsUpDown,
		TextCursorInput,
		AlignLeft,
		Tags,
		CheckSquare,
		ToggleLeft,
		MessagesSquare,
		PanelRight,
		Info,
		Square,
		Shapes,
		Bone,
		PanelRightClose,
		AlertTriangle,
		Bell
	} from 'lucide-svelte';

	let { children } = $props();

	const sidebarItems = [
		{ label: 'Home', icon: House, path: '/' },
		{ label: 'Button', icon: ArrowDown, path: '/button' },
		{ label: 'Dropdown Menu', icon: ChevronDown, path: '/dropdown-menu' },
		{ label: 'Select', icon: ListFilter, path: '/select' },
		{ label: 'Combobox', icon: Search, path: '/combobox' },
		{ label: 'Table', icon: Table2, path: '/table' },
		{ label: 'DataTable', icon: LayoutList, path: '/data-table' },
		{ label: 'Accordion', icon: ChevronsUpDown, path: '/accordion' },
		{ label: 'Input', icon: TextCursorInput, path: '/input' },
		{ label: 'Textarea', icon: AlignLeft, path: '/textarea' },
		{ label: 'Label', icon: Tags, path: '/label' },
		{ label: 'Checkbox', icon: CheckSquare, path: '/checkbox' },
		{ label: 'Switch', icon: ToggleLeft, path: '/switch' },
		{ label: 'Dialog', icon: MessagesSquare, path: '/dialog' },
		{ label: 'Popover', icon: PanelRight, path: '/popover' },
		{ label: 'Tooltip', icon: Info, path: '/tooltip' },
		{ label: 'Card', icon: Square, path: '/card' },
		{ label: 'Badge', icon: Shapes, path: '/badge' },
		{ label: 'Skeleton', icon: Bone, path: '/skeleton' },
		{ label: 'Tabs', icon: PanelRightClose, path: '/tabs' },
		{ label: 'Alert', icon: AlertTriangle, path: '/alert' },
		{ label: 'Sonner', icon: Bell, path: '/sonner' }
	];
</script>

<svelte:head><link rel="icon" href={favicon} /></svelte:head>
<BespokeLayout title="Bespoke" {sidebarItems}>
	{@render children()}
</BespokeLayout>
