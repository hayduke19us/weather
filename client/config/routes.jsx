var React = require('react');
var Router = require('react-router-component')
var NotFound = Router.NotFound

var Locations = Router.Locations
var Location = Router.Location

var App = require('../components/layout/App.jsx');
var WeatherLarge = require('../components/widgets/weather_large.jsx')

var NotFoundPage = React.createClass({
  render: function () {
    return (
      <div className='center'>
        <h1>Not Found</h1>
      </div>
    )
  }
})

module.exports = React.createClass({
  render: function() {
    return (
      <Locations>
        <Location path="/" handler={App} />
        <Location path="/weather" handler={WeatherLarge} />
        <NotFound handler={NotFoundPage} />
      </Locations>
    )
  }
})

