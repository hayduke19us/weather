var React = require('react');
var ReactDom = require('react-dom')
var App = require('./components/layout/App.jsx');
var Weather = require('./components/widgets/weather.jsx')
var Thermostat = require('./components/widgets/thermostat.jsx')
var Garden = require('./components/widgets/garden.jsx')
var Internet = require('./components/widgets/internet.jsx')
var Lights = require('./components/widgets/lights.jsx')

require('./stylesheets/main.scss')

ReactDom.render(<App/>, document.getElementById('main-content'));
ReactDom.render(<Weather/>, document.getElementById('weather'));
ReactDom.render(<Thermostat/>, document.getElementById('thermo'));
ReactDom.render(<Garden/>, document.getElementById('garden'));
ReactDom.render(<Internet/>, document.getElementById('internet'));
ReactDom.render(<Lights/>, document.getElementById('lights'));
