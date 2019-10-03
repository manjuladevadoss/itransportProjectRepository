<StyledLayerDescriptor xmlns="http://www.opengis.net/sld" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:se="http://www.opengis.net/se" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="1.1.0" xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.1.0/StyledLayerDescriptor.xsd" xmlns:ogc="http://www.opengis.net/ogc">
  <NamedLayer>
    <se:Name>links_80_percentage</se:Name>
    <UserStyle>
      <se:Name>links_80_percentage</se:Name>
      <se:FeatureTypeStyle>
        <se:Rule>
          <se:Name>gis carriageway majorroad</se:Name>
          <se:Description>
            <se:Title>gis carriageway majorroad</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc"> 
            <ogc:Or> 
            <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>cat</ogc:PropertyName>
                <ogc:Literal>CATA</ogc:Literal>
              </ogc:PropertyIsEqualTo>
             <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>cat</ogc:PropertyName>
                <ogc:Literal>CATB</ogc:Literal>
              </ogc:PropertyIsEqualTo> 
               <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>cat</ogc:PropertyName>
                <ogc:Literal>CATC</ogc:Literal>
              </ogc:PropertyIsEqualTo> 
            
            <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>cat</ogc:PropertyName>
                <ogc:Literal>CATD</ogc:Literal>
              </ogc:PropertyIsEqualTo>          
             
          <!--  <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>cat</ogc:PropertyName>
                <ogc:Literal>CATE</ogc:Literal>
              </ogc:PropertyIsEqualTo>
                 <ogc:PropertyIsEqualTo>
           <ogc:PropertyName>cat</ogc:PropertyName>
                <ogc:Literal>SLIP ROAD</ogc:Literal>
              </ogc:PropertyIsEqualTo> 
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>cat</ogc:PropertyName>
                <ogc:Literal>ST</ogc:Literal>
              </ogc:PropertyIsEqualTo>             -->
            </ogc:Or>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#4c4cff</se:SvgParameter>
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