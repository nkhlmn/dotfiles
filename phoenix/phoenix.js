require('./helpers.js');
require('./config.js');

console.log(config.defaultBrowser)

const toggleModifier = ['ctrl', 'cmd'];
const toggleMappings = [
  ['t', toggleModifier, () => toggleApp(config.defaultTerminal)],
  ['space', toggleModifier, () => toggleApp(config.defaultTerminal)],
  ['w', toggleModifier, () => toggleApp(config.defaultBrowser)],
  ['v', toggleModifier, () => toggleApp(App.get('Code') ? 'Code' : 'Visual Studio Code')],
];

toggleMappings.forEach(mapping => Key.on(...mapping));

/* Log focused app name to logs               */
/* To see logs run this command in terminal:  */
/*      `log stream --process Phoenix`        */
// Key.on('g', globalModifier, () => {
//   let app = App.focused();
//   Phoenix.log(app.name());
// });
