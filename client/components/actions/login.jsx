var React = require('react')
var Link = require('react-router-component').Link

var Icons = require('../layout/icons.jsx')

module.exports = React.createClass({

  getInitialState: function () {
    return { login_color: 'lights' }
  },

  change_login_background: function () {
    setInterval(this.change_color, 5000)
  },

  change_color: function () {
    var colors = ['weather', 'internet', 'garden', 'lights']
    var color = colors[Math.floor((Math.random() * 3) + 0)]
    this.setState({
      login_color:  color
    })
  },

  componentDidMount: function () {
    if (this.isMounted()) {
      this.change_login_background()
    }
  },

  render: function(){
    var woodUrl = './wood-back-lg.jpg'
    var paperUrl = './paperball-stack.png'

    var woodStyle = {
      backgroundImage: 'url(' + woodUrl +')'
    }

    var paperBalls = {
      backgroundImage: 'url(' + paperUrl + ')',
      height: '300px',
    }

    return  (
      <div className='vextend' style={woodStyle}>
        <div className='container-fluid'>
          <div className='row'>
            <div className='col-lg-4'>
              <div className={'widget ' + this.state.login_color + ' white vcenter'}>
                <h1>Login</h1>
                <h2>Email</h2>
                <input className='form-control' type='text' name='email' />
                <h2>Password</h2>
                <input className='form-control' type='text' name='email' />
                <Link href='/dash'><h4>New? Sign up</h4></Link> 
              </div>
            </div>
            <div className='col-lg-8 white'>
              <div className='center vcenter'>
                <image src='./notepaper.png' alt='No Image'/>
              </div>
            </div>
          </div>
        </div>
        <div id='footer'>
          <div className='container-fluid'>
            <div style={paperBalls}></div>
          </div>
        </div>
      </div>
    )
  }

})
