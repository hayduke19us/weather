var React = require('react');
var Link = require('react-router-component').Link
var ReactDom = require('react-dom')
var ListDailyWeather = require('./list_daily_weather.jsx')

module.exports = React.createClass({
  getInitialState: function() {
    return {data: '', testData: ''};
  },

  componentDidMount: function() {
    if (this.isMounted()) {
      console.log('weather large has mounted')
    }
  },

  render: function() {
    return (
      <div className='container-fluid'>
        <div className='row'>
          <div className='col-lg-12'>
            <Link href='/'>
              <span className='climacon rain large-icon'/>
            </Link>
            <ListDailyWeather/>
          </div>
        </div>
      </div>
   )
  }
})
