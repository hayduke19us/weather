var React = require('react');
var Link = require('react-router-component').Link
var ReactDom = require('react-dom')
var FontA_ = require('react-fontawesome')
var reqwest = require('reqwest')

module.exports = React.createClass({
  getInitialState: function() {
    return {data: ''};
  },

  componentDidMount: function() {
    if (this.isMounted()) {
      console.log('this is mounted')
      this.getDailyWeather(this)
    }
  },

  getDailyWeather: function(self) {
    console.log('making request')
    reqwest({
      url: 'http://localhost:5000/weathers/daily/10',
      method: 'GET',
      contentType: 'application/json',
      success: function (resp) {
        console.log(JSON.parse(resp[0].daily).data[0].icon)
        self.setState({
          data: JSON.parse(resp[0].daily).data[0]
        })
      }
    })
  },

  render: function() {
    return (
      <div className='widget lg weather'>
        <h1>{this.state.data.icon}</h1>
        <Link href='/'><h1>Back</h1></Link>
      </div>
   )
  }
})
