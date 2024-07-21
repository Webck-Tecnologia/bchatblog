import { defineConfig } from 'astro/config';

import preact from "@astrojs/preact";

// https://astro.build/config
export default defineConfig({
  // TODO: Change to netlify URL
  site: "https://master--stirring-faloodeh-1e7102.netlify.app/",
  integrations: [preact()]
});
