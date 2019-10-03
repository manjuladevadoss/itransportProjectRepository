<StyledLayerDescriptor xmlns="http://www.opengis.net/sld" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:se="http://www.opengis.net/se" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="1.1.0" xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.1.0/StyledLayerDescriptor.xsd" xmlns:ogc="http://www.opengis.net/ogc">
  <NamedLayer>
    <se:Name>links_80_percentage</se:Name>
    <UserStyle>
      <se:Name>links_80_percentage</se:Name>
      <se:FeatureTypeStyle>
        <se:Rule> <!-- Dark Red Layer Expressway-->
          <se:Name>gis speedlink</se:Name>
          <se:Description>
            <se:Title>gis speedlink</se:Title>
          </se:Description>		  
		  <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">   
            <ogc:And> 
			<ogc:PropertyIsEqualTo>
                 <ogc:PropertyName>cat</ogc:PropertyName>
                <ogc:Literal>CATA</ogc:Literal>
              </ogc:PropertyIsEqualTo> 
               <ogc:PropertyIsLessThan> 
                <ogc:PropertyName>speed</ogc:PropertyName>
                <ogc:Literal>20</ogc:Literal>
              </ogc:PropertyIsLessThan>  
              </ogc:And> 
          </ogc:Filter>  
          
           <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#8b0000</se:SvgParameter>
              <se:SvgParameter name="stroke-width">3</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer> 
          </se:Rule>
        <se:Rule> <!-- Red Layer -->
            <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">  
                <ogc:And> 
			<ogc:PropertyIsEqualTo>
                 <ogc:PropertyName>cat</ogc:PropertyName>
                <ogc:Literal>CATA</ogc:Literal>
              </ogc:PropertyIsEqualTo>
                
        <ogc:PropertyIsGreaterThan> 
                <ogc:PropertyName>speed</ogc:PropertyName>
                <ogc:Literal>21</ogc:Literal>
              </ogc:PropertyIsGreaterThan>
               <ogc:PropertyIsLessThan> 
                <ogc:PropertyName>speed</ogc:PropertyName>
                <ogc:Literal>40</ogc:Literal>
              </ogc:PropertyIsLessThan>   
                  </ogc:And> 
          </ogc:Filter> 
           <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#FF0000</se:SvgParameter>
              <se:SvgParameter name="stroke-width">2</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
         </se:Rule> 
       <se:Rule> <!-- Amber Layer -->
       <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">  
         <ogc:And>
			<ogc:PropertyIsEqualTo>
                 <ogc:PropertyName>cat</ogc:PropertyName>
                <ogc:Literal>CATA</ogc:Literal>
              </ogc:PropertyIsEqualTo>
              <ogc:PropertyIsGreaterThan> 
                <ogc:PropertyName>speed</ogc:PropertyName>
                <ogc:Literal>40</ogc:Literal>
              </ogc:PropertyIsGreaterThan>
               <ogc:PropertyIsLessThan> 
                <ogc:PropertyName>speed</ogc:PropertyName>
                <ogc:Literal>60</ogc:Literal>
              </ogc:PropertyIsLessThan>    
           </ogc:And>
          </ogc:Filter>                       
           <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#ffbf00</se:SvgParameter>
              <se:SvgParameter name="stroke-width">2</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>          
          </se:Rule> 
        
         <se:Rule> <!-- Red Layer  Breakdown Icon display area-->
            <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">  
                <ogc:And> 
			<ogc:PropertyIsEqualTo>
                 <ogc:PropertyName>link_id</ogc:PropertyName>
                <ogc:Literal>104009694</ogc:Literal>
              </ogc:PropertyIsEqualTo>
       
                  </ogc:And> 
          </ogc:Filter> 
           <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#FF0000</se:SvgParameter>
              <se:SvgParameter name="stroke-width">2</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
         </se:Rule> 
      
        
           <se:Rule> <!-- Green Layer -->
       <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">  
         <ogc:And>
			<ogc:PropertyIsEqualTo>
                 <ogc:PropertyName>cat</ogc:PropertyName>
                <ogc:Literal>CATA</ogc:Literal>
              </ogc:PropertyIsEqualTo>
              <ogc:PropertyIsGreaterThan> 
                <ogc:PropertyName>speed</ogc:PropertyName>
                <ogc:Literal>60</ogc:Literal>
              </ogc:PropertyIsGreaterThan>  
           </ogc:And>
          </ogc:Filter>                       
           <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#1fc600</se:SvgParameter> 
              <se:SvgParameter name="stroke-width">2</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>          
          </se:Rule> 
        
        
        <se:Rule> <!-- Dark Red Layer Arterial Road 1 -->
          <se:Name>gis speedlink</se:Name>
          <se:Description>
            <se:Title>gis speedlink</se:Title>
          </se:Description>		  
		  <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">   
            <ogc:And> 
			<ogc:PropertyIsEqualTo>
                 <ogc:PropertyName>cat</ogc:PropertyName>
                <ogc:Literal>CATC</ogc:Literal>
              </ogc:PropertyIsEqualTo> 
               <ogc:PropertyIsLessThan> 
                <ogc:PropertyName>speed</ogc:PropertyName>
                <ogc:Literal>10</ogc:Literal>
              </ogc:PropertyIsLessThan>  
              </ogc:And> 
          </ogc:Filter>  
          
           <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#8b0000</se:SvgParameter>
              <se:SvgParameter name="stroke-width">2</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer> 
          </se:Rule>
        <se:Rule> <!-- Red Layer -->
            <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">  
                <ogc:And> 
			<ogc:PropertyIsEqualTo>
                 <ogc:PropertyName>cat</ogc:PropertyName>
                <ogc:Literal>CATC</ogc:Literal>
              </ogc:PropertyIsEqualTo>
                
        <ogc:PropertyIsGreaterThan> 
                <ogc:PropertyName>speed</ogc:PropertyName>
                <ogc:Literal>11</ogc:Literal>
              </ogc:PropertyIsGreaterThan>
               <ogc:PropertyIsLessThan> 
                <ogc:PropertyName>speed</ogc:PropertyName>
                <ogc:Literal>20</ogc:Literal>
              </ogc:PropertyIsLessThan>   
                  </ogc:And> 
          </ogc:Filter> 
           <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#FF0000</se:SvgParameter>
              <se:SvgParameter name="stroke-width">2</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
         </se:Rule> 
       <se:Rule> <!-- Amber Layer -->
       <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">  
         <ogc:And>
			<ogc:PropertyIsEqualTo>
                 <ogc:PropertyName>cat</ogc:PropertyName>
                <ogc:Literal>CATC</ogc:Literal>
              </ogc:PropertyIsEqualTo>
              <ogc:PropertyIsGreaterThan> 
                <ogc:PropertyName>speed</ogc:PropertyName>
                <ogc:Literal>21</ogc:Literal>
              </ogc:PropertyIsGreaterThan>
               <ogc:PropertyIsLessThan> 
                <ogc:PropertyName>speed</ogc:PropertyName>
                <ogc:Literal>40</ogc:Literal>
              </ogc:PropertyIsLessThan>    
           </ogc:And>
          </ogc:Filter>                       
           <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#ffbf00</se:SvgParameter>
              <se:SvgParameter name="stroke-width">2</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>          
          </se:Rule> 
        
           <se:Rule> <!-- Green Layer -->
       <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">  
         <ogc:And>
			<ogc:PropertyIsEqualTo>
                 <ogc:PropertyName>cat</ogc:PropertyName>
                <ogc:Literal>CATC</ogc:Literal>
              </ogc:PropertyIsEqualTo>
              <ogc:PropertyIsGreaterThan> 
                <ogc:PropertyName>speed</ogc:PropertyName>
                <ogc:Literal>40</ogc:Literal>
              </ogc:PropertyIsGreaterThan>  
           </ogc:And>
          </ogc:Filter>                       
           <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#1fc600</se:SvgParameter> 
              <se:SvgParameter name="stroke-width">2</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>          
          </se:Rule> 
        
        <se:Rule> <!-- Dark Red Layer Arterial Road 2 -->
          <se:Name>gis speedlink</se:Name>
          <se:Description>
            <se:Title>gis speedlink</se:Title>
          </se:Description>		  
		  <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">   
            <ogc:And> 
			<ogc:PropertyIsEqualTo>
                 <ogc:PropertyName>cat</ogc:PropertyName>
                <ogc:Literal>CATB</ogc:Literal>
              </ogc:PropertyIsEqualTo> 
               <ogc:PropertyIsLessThan> 
                <ogc:PropertyName>speed</ogc:PropertyName>
                <ogc:Literal>10</ogc:Literal>
              </ogc:PropertyIsLessThan>  
              </ogc:And> 
          </ogc:Filter>  
          
           <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#8b0000</se:SvgParameter>
              <se:SvgParameter name="stroke-width">2</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer> 
          </se:Rule>
        <se:Rule> <!-- Red Layer -->
            <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">  
                <ogc:And> 
			<ogc:PropertyIsEqualTo>
                 <ogc:PropertyName>cat</ogc:PropertyName>
                <ogc:Literal>CATB</ogc:Literal>
              </ogc:PropertyIsEqualTo>
                
        <ogc:PropertyIsGreaterThan> 
                <ogc:PropertyName>speed</ogc:PropertyName>
                <ogc:Literal>11</ogc:Literal>
              </ogc:PropertyIsGreaterThan>
               <ogc:PropertyIsLessThan> 
                <ogc:PropertyName>speed</ogc:PropertyName>
                <ogc:Literal>20</ogc:Literal>
              </ogc:PropertyIsLessThan>   
                  </ogc:And> 
          </ogc:Filter> 
           <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#FF0000</se:SvgParameter>
              <se:SvgParameter name="stroke-width">2</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
         </se:Rule> 
       <se:Rule> <!-- Amber Layer -->
       <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">  
         <ogc:And>
			<ogc:PropertyIsEqualTo>
                 <ogc:PropertyName>cat</ogc:PropertyName>
                <ogc:Literal>CATB</ogc:Literal>
              </ogc:PropertyIsEqualTo>
              <ogc:PropertyIsGreaterThan> 
                <ogc:PropertyName>speed</ogc:PropertyName>
                <ogc:Literal>21</ogc:Literal>
              </ogc:PropertyIsGreaterThan>
               <ogc:PropertyIsLessThan> 
                <ogc:PropertyName>speed</ogc:PropertyName>
                <ogc:Literal>40</ogc:Literal>
              </ogc:PropertyIsLessThan>    
           </ogc:And>
          </ogc:Filter>                       
           <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#ffbf00</se:SvgParameter>
              <se:SvgParameter name="stroke-width">2</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>          
          </se:Rule> 
        
           <se:Rule> <!-- Green Layer -->
       <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">  
         <ogc:And>
			<ogc:PropertyIsEqualTo>
                 <ogc:PropertyName>cat</ogc:PropertyName>
                <ogc:Literal>CATB</ogc:Literal>
              </ogc:PropertyIsEqualTo>
              <ogc:PropertyIsGreaterThan> 
                <ogc:PropertyName>speed</ogc:PropertyName>
                <ogc:Literal>40</ogc:Literal>
              </ogc:PropertyIsGreaterThan>  
           </ogc:And>
          </ogc:Filter>                       
           <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#1fc600</se:SvgParameter> 
              <se:SvgParameter name="stroke-width">2</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>          
          </se:Rule> 
          <se:Rule> <!-- Accident Area Red Layer -->
        <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">     
		<ogc:Or>	
          <ogc:PropertyIsEqualTo>
				<ogc:PropertyName>link_id</ogc:PropertyName>
				<ogc:Literal>103065376</ogc:Literal>
			</ogc:PropertyIsEqualTo>
            <ogc:PropertyIsEqualTo>
				<ogc:PropertyName>link_id</ogc:PropertyName>
				<ogc:Literal>103091955</ogc:Literal>
			</ogc:PropertyIsEqualTo>
        </ogc:Or>
        </ogc:Filter> 
           <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#FF0000</se:SvgParameter>
              <se:SvgParameter name="stroke-width">2</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
         </se:Rule>
        <se:Rule> <!-- Accident Area Red Layer -->
        <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">     
            <ogc:PropertyIsEqualTo>
				<ogc:PropertyName>link_id</ogc:PropertyName>
				<ogc:Literal>103091955</ogc:Literal>
			</ogc:PropertyIsEqualTo>
        </ogc:Filter> 
           <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#FF0000</se:SvgParameter>
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