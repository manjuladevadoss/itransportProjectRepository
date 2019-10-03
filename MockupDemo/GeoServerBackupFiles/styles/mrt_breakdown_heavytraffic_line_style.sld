<StyledLayerDescriptor xmlns="http://www.opengis.net/sld" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:se="http://www.opengis.net/se" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="1.1.0" xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.1.0/StyledLayerDescriptor.xsd" xmlns:ogc="http://www.opengis.net/ogc">
  <NamedLayer>
    <se:Name>links_80_percentage</se:Name>
    <UserStyle>
      <se:Name>links_80_percentage</se:Name>
      <se:FeatureTypeStyle>
        <se:Rule>
          <se:Name>heavy traffic</se:Name>
          <se:Description>
            <se:Title>heavy traffic</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:Or>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>link_id</ogc:PropertyName>
                <ogc:Literal>103072610</ogc:Literal>
              </ogc:PropertyIsEqualTo>  
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>link_id</ogc:PropertyName>
                <ogc:Literal>103105170</ogc:Literal>
              </ogc:PropertyIsEqualTo>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>link_id</ogc:PropertyName>
                <ogc:Literal>103105175</ogc:Literal>
              </ogc:PropertyIsEqualTo>
               <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>link_id</ogc:PropertyName>
                <ogc:Literal>103010788</ogc:Literal>
              </ogc:PropertyIsEqualTo>
           	<ogc:PropertyIsEqualTo>
                <ogc:PropertyName>link_id</ogc:PropertyName>
                <ogc:Literal>103114787</ogc:Literal>
              </ogc:PropertyIsEqualTo>
             <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>link_id</ogc:PropertyName>
                <ogc:Literal>103072083</ogc:Literal>
              </ogc:PropertyIsEqualTo>
               <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>link_id</ogc:PropertyName>
                <ogc:Literal>103072306</ogc:Literal>
              </ogc:PropertyIsEqualTo>      
            
            </ogc:Or>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#e81414</se:SvgParameter>
              <se:SvgParameter name="stroke-width">2</se:SvgParameter>
             </se:Stroke>
          </se:LineSymbolizer>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#e81414</se:SvgParameter>
              <se:SvgParameter name="stroke-width">3</se:SvgParameter>
              <se:SvgParameter name="stroke-dasharray">5 2</se:SvgParameter>
            </se:Stroke>
            <PerpendicularOffset>3</PerpendicularOffset>
          </se:LineSymbolizer>
        </se:Rule>        
      </se:FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>