var React = require('react');
var ReactDom = require('react-dom')
var Router = require('react-router-component')
var NotFound = Router.NotFound

var Locations = Router.Locations
var Location = Router.Location

var Layout = require('./components/layout/App.jsx');
var Weather = require('./components/widgets/weather.jsx')
var WeatherLarge = require('./components/widgets/weather_large.jsx')
var Thermostat = require('./components/widgets/thermostat.jsx')
var Garden = require('./components/widgets/garden.jsx')
var Internet = require('./components/widgets/internet.jsx')
var Lights = require('./components/widgets/lights.jsx')

require('./stylesheets/main.scss')

var NotFoundPage = React.createClass({
  render: function () {
    return (
      <h1>Not Found</h1>
    )
  }
})

var App = React.createClass({

  render: function() {
    return (
      <Locations>
        <Location path="/" handler={Layout} />
        <Location path="/weather" handler={WeatherLarge} />
        <NotFound handler={NotFoundPage} />
      </Locations>
    )
  }
})

ReactDom.render(React.createElement(App), document.getElementById('main-content'))
ReactDom.render(<Weather/>, document.getElementById('weather'));
ReactDom.render(<Thermostat/>, document.getElementById('thermo'));
ReactDom.render(<Garden/>, document.getElementById('garden'));
ReactDom.render(<Internet/>, document.getElementById('internet'));
ReactDom.render(<Lights/>, document.getElementById('lights'));

