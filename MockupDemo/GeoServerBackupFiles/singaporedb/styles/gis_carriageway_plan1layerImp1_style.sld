<StyledLayerDescriptor xmlns="http://www.opengis.net/sld" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:se="http://www.opengis.net/se" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="1.1.0" xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.1.0/StyledLayerDescriptor.xsd" xmlns:ogc="http://www.opengis.net/ogc">
  <NamedLayer>
    <se:Name>carriageway plan1 Imp1 </se:Name>
    <UserStyle>
      <se:Name>carriageway plan1 Imp1</se:Name>
      <se:FeatureTypeStyle>
        
         <se:Rule>
          <se:Name>Traffic Condition red implement</se:Name>
          <se:Description>
            <se:Title>Traffic Condition red</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">       
            <ogc:Or>   
			  <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>link_id</ogc:PropertyName>
                <ogc:Literal>103104151</ogc:Literal>
              </ogc:PropertyIsEqualTo>       
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>link_id</ogc:PropertyName>
                <ogc:Literal>103104154</ogc:Literal>
              </ogc:PropertyIsEqualTo>
			  <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>link_id</ogc:PropertyName>
                <ogc:Literal>103104159</ogc:Literal>
              </ogc:PropertyIsEqualTo>
    
  	
              
           </ogc:Or>  
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#e81414</se:SvgParameter>
              <se:SvgParameter name="stroke-width">2</se:SvgParameter>
             </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
         <se:Rule>
          <se:Name>Traffic Condition orange</se:Name>
          <se:Description>
            <se:Title>Traffic Condition orange</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">       
            <ogc:Or>  
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>link_id</ogc:PropertyName>
                <ogc:Literal>103104162</ogc:Literal>
              </ogc:PropertyIsEqualTo>   
			<ogc:PropertyIsEqualTo>
                <ogc:PropertyName>link_id</ogc:PropertyName>
                <ogc:Literal>103104162</ogc:Literal>
              </ogc:PropertyIsEqualTo>              	    
             <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>link_id</ogc:PropertyName>
                <ogc:Literal>103040718</ogc:Literal>
              </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>link_id</ogc:PropertyName>
                <ogc:Literal>103040723</ogc:Literal>
              </ogc:PropertyIsEqualTo>
           	 <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>link_id</ogc:PropertyName>
                <ogc:Literal>103103570</ogc:Literal>
              </ogc:PropertyIsEqualTo>  
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>link_id</ogc:PropertyName>
                <ogc:Literal>108002242</ogc:Literal>
              </ogc:PropertyIsEqualTo>	
             
              
           </ogc:Or>  
          </ogc:Filter>
           <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#ff8c00</se:SvgParameter>
              <se:SvgParameter name="stroke-width">2</se:SvgParameter>
             </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>Traffic Condition green</se:Name>
          <se:Description>
            <se:Title>Traffic Condition green</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">       
            <ogc:Or>  
       <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>link_id</ogc:PropertyName>
                <ogc:Literal>103065419</ogc:Literal>
              </ogc:PropertyIsEqualTo>
              
          	
               <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>link_id</ogc:PropertyName>
                <ogc:Literal>103065423</ogc:Literal>
              </ogc:PropertyIsEqualTo> 
              
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>link_id</ogc:PropertyName>
                <ogc:Literal>103065818</ogc:Literal>
              </ogc:PropertyIsEqualTo>
			  <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>link_id</ogc:PropertyName>
                <ogc:Literal>103065822</ogc:Literal>
              </ogc:PropertyIsEqualTo>
              
              <!-- First line layer -->
               <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>link_id</ogc:PropertyName>
                <ogc:Literal>103091955</ogc:Literal>
              </ogc:PropertyIsEqualTo>
           </ogc:Or>  
          </ogc:Filter>
           <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#10b526</se:SvgParameter>
              <se:SvgParameter name="stroke-width">2</se:SvgParameter>
             </se:Stroke>
          </se:LineSymbolizer>    
        </se:Rule>
        
        
        
      </se:FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>