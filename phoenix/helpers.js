/* TOGGLE OR LAUNCH APPLICATION */
function toggleApp(appName) {
  const app = App.get(appName)
  if (app) {
    app.isActive() ? app.hide() : app.focus()
  } else {
    App.launch(appName)
  }
}


