var React = require('react');
var FontA_ = require('react-fontawesome');
var reqwest = require('reqwest')

module.exports = React.createClass({
  getInitialState: function() {
    return {
      data: '',
    };
  },

  componentDidMount: function() {
    if (this.isMounted()) {
      this.getWeather(this)
    }
  },

  getWeather: function(self) {
    reqwest({
      url: 'http://localhost:5000/weathers',
      method: 'GET',
      contentType: 'application/json',
      success: function (resp) {
        console.log(resp)
        self.setState({
          data: resp[0].current
        })
      }
    })
  },


  render: function() {
    return (
      <a href='#'>
        <div className='widget weather'>
          <h1>{this.state.data}</h1>
          <div className='center'>
            <FontA_ className='large-icon' name='cloud'
            style={{ color: 'white' }} />
          </div>
        </div>
      </a>
    );
  }
})
