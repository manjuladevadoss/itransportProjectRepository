<StyledLayerDescriptor xmlns="http://www.opengis.net/sld" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:se="http://www.opengis.net/se" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="1.1.0" xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.1.0/StyledLayerDescriptor.xsd" xmlns:ogc="http://www.opengis.net/ogc">
  <NamedLayer>
    <se:Name>links_80_percentage</se:Name>
    <UserStyle>
      <se:Name>links_80_percentage</se:Name>
      <se:FeatureTypeStyle>
       <se:Rule>
          <se:Name>cte opp green</se:Name>
          <se:Description>
            <se:Title>cte opp traffic green</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">       
            <ogc:And>  
           	 <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>objectid</ogc:PropertyName>
                <ogc:Literal>421</ogc:Literal>
              </ogc:PropertyIsEqualTo>       
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>loc_code_i</ogc:PropertyName>
                <ogc:Literal>1</ogc:Literal>
              </ogc:PropertyIsEqualTo>
           </ogc:And>  
            
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#00FF00</se:SvgParameter>
              <se:SvgParameter name="stroke-width">2</se:SvgParameter>
             </se:Stroke>
          </se:LineSymbolizer>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#00FF00</se:SvgParameter>
              <se:SvgParameter name="stroke-width">2</se:SvgParameter>
              <se:SvgParameter name="stroke-dasharray">5 2</se:SvgParameter>
            </se:Stroke>
            <PerpendicularOffset>3</PerpendicularOffset>
          </se:LineSymbolizer> 
        </se:Rule>
        
         <se:Rule>
          <se:Name>cte opp green</se:Name>
          <se:Description>
            <se:Title>cte opp traffic green</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">       
            <ogc:And>  
           	 <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>objectid</ogc:PropertyName>
                <ogc:Literal>211</ogc:Literal>
              </ogc:PropertyIsEqualTo>       
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>loc_code_i</ogc:PropertyName>
                <ogc:Literal>2</ogc:Literal>
              </ogc:PropertyIsEqualTo>
           </ogc:And>  
            
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#00FF00</se:SvgParameter>
              <se:SvgParameter name="stroke-width">2</se:SvgParameter>
             </se:Stroke>
          </se:LineSymbolizer>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#00FF00</se:SvgParameter>
              <se:SvgParameter name="stroke-width">2</se:SvgParameter>
              <se:SvgParameter name="stroke-dasharray">5 2</se:SvgParameter>
            </se:Stroke>
            <PerpendicularOffset>3</PerpendicularOffset>
          </se:LineSymbolizer> 
        </se:Rule>
        
      </se:FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>