# Node

## Intl and ICU

If you use i18n features like
[Intl](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl),
you need ICU (International Components for Unicode).
Your local `node` installation will most likely have the full ICU installed, but it's often missing on servers or containers.

Node will fall back to the locale it has installed, so consider writing a test to make sure your locale is available. 
Below are two options on how to get full ICU data.

### Compile node yourself

Use the flag `--with-intl=full-icu` to compile node with full ICU (see [ICU options](https://nodejs.org/api/intl.html#intl_options_for_building_node_js)). 

### Provide ICU data at runtime

Install the package [full-icu](https://www.npmjs.com/package/full-icu) and tell node to use it by either setting the environment variable `NODE_ICU_DATA=node_modules/full-icu` or passing `--icu-data-dir=node_modules/full-icu`. You can find more detailed information in the official [documentation](https://nodejs.org/api/intl.html#intl_providing_icu_data_at_runtime).
