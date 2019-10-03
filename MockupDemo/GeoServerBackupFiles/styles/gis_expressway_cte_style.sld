<StyledLayerDescriptor xmlns="http://www.opengis.net/sld" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:se="http://www.opengis.net/se" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="1.1.0" xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.1.0/StyledLayerDescriptor.xsd" xmlns:ogc="http://www.opengis.net/ogc">
  <NamedLayer>
    <se:Name>links_80_percentage</se:Name>
    <UserStyle>
      <se:Name>links_80_percentage</se:Name>
      <se:FeatureTypeStyle>
        <se:Rule>
          <se:Name>cte heavy traffic</se:Name>
          <se:Description>
            <se:Title>cte heavy traffic</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc"> 
            <!-- <ogc:Or> -->
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>roadname</ogc:PropertyName>
                <ogc:Literal>CTE</ogc:Literal>
              </ogc:PropertyIsEqualTo> 
       <!--          <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>roadname</ogc:PropertyName>
                <ogc:Literal>CTE</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:Or> -->
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#1ced6f</se:SvgParameter>
              <se:SvgParameter name="stroke-width">2</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>        
      </se:FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>