<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor xmlns="http://www.opengis.net/sld" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:se="http://www.opengis.net/se" version="1.1.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ogc="http://www.opengis.net/ogc" xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.1.0/StyledLayerDescriptor.xsd">
  <NamedLayer>
    <se:Name>gis_ptz_attr</se:Name>
    <UserStyle>
      <se:Name>gis_ptz_attr</se:Name>
      <se:FeatureTypeStyle>
        <se:Rule>
          <se:Name></se:Name>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>status</ogc:PropertyName>
                <ogc:Literal>0</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:PointSymbolizer>
            <Graphic>
              <ExternalGraphic>
                 <!-- <OnlineResource xlink:type="simple" xlink:href="http://localhost:8088/geoserver/styles/images/gis_ptz_attr/0.png" />  -->
                
                <OnlineResource xlink:type="simple" xlink:href="http://localhost:8088/geoserver/styles/images/gis_ptz_attr/2.PNG" />
                 <Format>image/png</Format>
              </ExternalGraphic>
              <Size>25</Size>
            </Graphic>
          </se:PointSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name></se:Name>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>status</ogc:PropertyName>
                <ogc:Literal>1</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:PointSymbolizer>
            <Graphic>
              <ExternalGraphic>
                 <!-- <OnlineResource xlink:type="simple" xlink:href="http://localhost:8088/geoserver/styles/images/gis_ptz_attr/1.png" /> -->
                <OnlineResource xlink:type="simple" xlink:href="http://localhost:8088/geoserver/styles/images/gis_ptz_attr/2.PNG" /> 
                 <Format>image/png</Format>
              </ExternalGraphic>
              <Size>25</Size>
            </Graphic>
          </se:PointSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name></se:Name>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>status</ogc:PropertyName>
                <ogc:Literal>2</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:PointSymbolizer>
            <Graphic>
              <ExternalGraphic>
                 <OnlineResource xlink:type="simple" xlink:href="http://localhost:8088/geoserver/styles/images/gis_ptz_attr/2.PNG" />
                 <Format>image/png</Format>
              </ExternalGraphic>
              <Size>25</Size>
            </Graphic>
          </se:PointSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name></se:Name>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>status</ogc:PropertyName>
                <ogc:Literal>3</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:PointSymbolizer>
            <Graphic>
              <ExternalGraphic>
                 <OnlineResource xlink:type="simple" xlink:href="http://localhost:8088/geoserver/styles/images/gis_ptz_attr/3.png" />
                 <Format>image/jpg</Format>
              </ExternalGraphic>
             <Size>25</Size>
            </Graphic>
          </se:PointSymbolizer>
        </se:Rule>
      </se:FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>