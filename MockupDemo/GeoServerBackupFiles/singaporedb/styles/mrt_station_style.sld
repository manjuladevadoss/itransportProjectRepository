<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor xmlns="http://www.opengis.net/sld" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:se="http://www.opengis.net/se" version="1.1.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ogc="http://www.opengis.net/ogc" xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.1.0/StyledLayerDescriptor.xsd">
  <NamedLayer>
    <se:Name>mrtlrtstnptt</se:Name>
    <UserStyle>
      <se:Name>mrtlrtstnptt</se:Name>
      <se:FeatureTypeStyle>
        <se:Rule>         
          <se:PointSymbolizer>
            <Graphic>
              <ExternalGraphic>
                 <OnlineResource xlink:type="simple" xlink:href="http://localhost:8088/geoserver/styles/images/mrtlrt.png" />
                 <Format>image/png</Format>
              </ExternalGraphic>
            </Graphic>
          </se:PointSymbolizer>
        </se:Rule>
<!--<se:Rule>
          <se:TextSymbolizer>
            <se:Label>
              <!ogc:Function name="strSubstring"> 
                <ogc:PropertyName>stn_name</ogc:PropertyName> 
                <ogc:Literal>0</ogc:Literal> 
                <ogc:Literal>11</ogc:Literal> 
              </ogc:Function>             
            </se:Label>
            <se:Font>
              <se:SvgParameter name="font-family">Arial</se:SvgParameter>
              <se:SvgParameter name="font-size">10</se:SvgParameter>
            </se:Font>
            <se:LabelPlacement>
              <se:LinePlacement>
                <se:GeneralizeLine>true</se:GeneralizeLine>
              </se:LinePlacement>
            </se:LabelPlacement>
            <se:Halo>
              <se:Radius>2</se:Radius>
              <se:Fill>
                <se:SvgParameter name="fill">#33648d</se:SvgParameter>
              </se:Fill>
            </se:Halo>
            <se:Fill>
              <se:SvgParameter name="fill">#ffffff</se:SvgParameter>
            </se:Fill>
          </se:TextSymbolizer>
        </se:Rule>    -->     
       </se:FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>