<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor xmlns="http://www.opengis.net/sld" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:se="http://www.opengis.net/se" version="1.1.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ogc="http://www.opengis.net/ogc" xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.1.0/StyledLayerDescriptor.xsd">
  <NamedLayer>
    <se:Name>gisdbo_gis_Detectcamera_traffic</se:Name>
    <UserStyle>
      <se:Name>gisdbo_gis_Detectcamera_traffic</se:Name>
      <se:FeatureTypeStyle>
        <se:Rule>
          <se:Name></se:Name>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:Or>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>eqt_type</ogc:PropertyName>
                <ogc:Literal>det</ogc:Literal>
              </ogc:PropertyIsEqualTo>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>eqt_type</ogc:PropertyName>
                <ogc:Literal>dtt</ogc:Literal>
              </ogc:PropertyIsEqualTo>              
            </ogc:Or>
          </ogc:Filter>
          <se:PointSymbolizer>
            <Graphic>
              <ExternalGraphic>
                 <OnlineResource xlink:type="simple" xlink:href="http://localhost:8088/geoserver/styles/images/gis_ptz_attr/3.PNG" />
                 <Format>image/png</Format>
              </ExternalGraphic>
              <Size>27</Size>
            </Graphic>
          </se:PointSymbolizer>
        </se:Rule>
      </se:FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>