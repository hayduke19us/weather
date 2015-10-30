React = require('react')

var FontA_ = require('react-fontawesome');
var WeatherIcon = require('../actions/weather_icon.jsx')



module.exports = React.createClass({

  render: function (){
    return (
      <div className={this.props.position}>

        <span className='climacon farenheit large-icon' />
        <WeatherIcon icon="sun"/>
        <FontA_ className='medium-icon' name='shopping-cart'
        style={{ color: 'white'}} />
        <FontA_ className='medium-icon' name='wifi'
        style={{ color: 'white' }} />
        <FontA_ className='medium-icon' name='light-bulb'
        style={{ color: 'white' }} />
        <FontA_ className='medium-icon' name='lightbulb-o'
        style={{ color: 'white' }} />
      </div>
    )
  }

})
