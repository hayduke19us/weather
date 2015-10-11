var __path__ = '../../client/components/widgets/weather.jsx'
jest.dontMock(__path__)

var React = require('react'),
    TestUtils = require('react-addons-test-utils'),
    ShallowRenderer = TestUtils.createRenderer();

var Weather = require(__path__)

describe('Weather', function(){
  ShallowRenderer.render(React.createElement(Weather))
  var output = ShallowRenderer.getRenderOutput()
  // We always have a div wrapper around our widget hence the first
  // props.children
  var widget = output.props.children.props

  it('has a a div with a className of widget weather', function(){
    expect(widget.children.props.className).toEqual('widget weather')
  })

  it('is a link to a larger view', function(){
    expect(widget.href).toEqual('/weather')
  })
});
