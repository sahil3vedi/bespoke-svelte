import adapter from '@sveltejs/adapter-node';
import { fileURLToPath } from 'url';
import path from 'path';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

/** @type {import('@sveltejs/kit').Config} */
const config = {
	compilerOptions: {
		// Force runes mode for the project, except for libraries. Can be removed in svelte 6.
		runes: ({ filename }) => (filename.split(/[/\\]/).includes('node_modules') ? undefined : true)
	},
	kit: {
		adapter: adapter(),
		alias:
			process.env.BESPOKE_SOURCE_ALIAS === 'true'
				? {
						'@sahil3vedi/bespoke-components': path.resolve(
							__dirname,
							'../bespoke-components/src/lib'
						)
					}
				: {}
	}
};

export default config;
