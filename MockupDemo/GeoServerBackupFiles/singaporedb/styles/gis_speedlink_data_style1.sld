<StyledLayerDescriptor xmlns="http://www.opengis.net/sld" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:se="http://www.opengis.net/se" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="1.1.0" xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.1.0/StyledLayerDescriptor.xsd" xmlns:ogc="http://www.opengis.net/ogc">
  <NamedLayer>
    <se:Name>links_80_percentage</se:Name>
    <UserStyle>
      <se:Name>links_80_percentage</se:Name>
      <se:FeatureTypeStyle>
        <se:Rule> <!-- Dark Red Layer traffic speed expressway -->
          <se:Name>gis speedlink_data_style1</se:Name>
          <se:Description>
            <se:Title>gis speedlink_data_style1</se:Title>
          </se:Description>		  
		  <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">   
            <ogc:And> 
			<ogc:PropertyIsEqualTo>
                 <ogc:PropertyName>cat</ogc:PropertyName>
                <ogc:Literal>CATA</ogc:Literal>
              </ogc:PropertyIsEqualTo> 
	 <ogc:PropertyIsBetween>
          <ogc:PropertyName>date_time</ogc:PropertyName>
          <ogc:LowerBoundary>
            <ogc:Literal>2019-07-18 02:10:00</ogc:Literal>
          </ogc:LowerBoundary>
          <ogc:UpperBoundary>
            <ogc:Literal>2019-07-18 02:15:00</ogc:Literal>
          </ogc:UpperBoundary>
      </ogc:PropertyIsBetween>		  
               <ogc:PropertyIsLessThan> 
                <ogc:PropertyName>speed</ogc:PropertyName>
                <ogc:Literal>10</ogc:Literal>
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
        <se:Rule> <!-- Dark Red Layer traffic speed NOT a expressway -->
        <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">   
            <ogc:And> 
			<ogc:PropertyIsEqualTo>
                 <ogc:PropertyName>cat</ogc:PropertyName>
                <ogc:Literal>CATB</ogc:Literal>
              </ogc:PropertyIsEqualTo> 
<ogc:PropertyIsBetween>
          <ogc:PropertyName>date_time</ogc:PropertyName>
          <ogc:LowerBoundary>
            <ogc:Literal>2019-07-18 02:10:00</ogc:Literal>
          </ogc:LowerBoundary>
          <ogc:UpperBoundary>
            <ogc:Literal>2019-07-18 02:15:00</ogc:Literal>
          </ogc:UpperBoundary>
      </ogc:PropertyIsBetween>		  		  
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
  
		<se:Rule> <!-- Red Layer traffic speed expressway -->
         <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">   
            <ogc:And> 
			<ogc:PropertyIsEqualTo>
                 <ogc:PropertyName>cat</ogc:PropertyName>
                <ogc:Literal>CATA</ogc:Literal>
              </ogc:PropertyIsEqualTo> 
<ogc:PropertyIsBetween>
          <ogc:PropertyName>date_time</ogc:PropertyName>
          <ogc:LowerBoundary>
            <ogc:Literal>2019-07-18 02:10:00</ogc:Literal>
          </ogc:LowerBoundary>
          <ogc:UpperBoundary>
            <ogc:Literal>2019-07-18 02:15:00</ogc:Literal>
          </ogc:UpperBoundary>
      </ogc:PropertyIsBetween>		   	
               <ogc:PropertyIsGreaterThan> 
                <ogc:PropertyName>speed</ogc:PropertyName>
                <ogc:Literal>20</ogc:Literal>
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
        <se:Rule> <!-- Red Layer traffic speed NOT a expressway -->
         <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">   
            <ogc:And> 
			<ogc:PropertyIsEqualTo>
                 <ogc:PropertyName>cat</ogc:PropertyName>
                <ogc:Literal>CATB</ogc:Literal>
              </ogc:PropertyIsEqualTo> 
<ogc:PropertyIsBetween>
          <ogc:PropertyName>date_time</ogc:PropertyName>
          <ogc:LowerBoundary>
            <ogc:Literal>2019-07-18 02:10:00</ogc:Literal>
          </ogc:LowerBoundary>
          <ogc:UpperBoundary>
            <ogc:Literal>2019-07-18 02:15:00</ogc:Literal>
          </ogc:UpperBoundary>
      </ogc:PropertyIsBetween>		  	
               <ogc:PropertyIsGreaterThan> 
                <ogc:PropertyName>speed</ogc:PropertyName>
                <ogc:Literal>10</ogc:Literal>
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
		  
        <se:Rule> <!-- Heavy traffic Area Red Layer -->
        <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">     
		<ogc:Or>	
          <ogc:PropertyIsEqualTo>
				<ogc:PropertyName>link_id</ogc:PropertyName>
				<ogc:Literal>103109178</ogc:Literal>
			</ogc:PropertyIsEqualTo>
            <ogc:PropertyIsEqualTo>
				<ogc:PropertyName>link_id</ogc:PropertyName>
				<ogc:Literal>103089227</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			            <ogc:PropertyIsEqualTo>
				<ogc:PropertyName>link_id</ogc:PropertyName>
				<ogc:Literal>103109175</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			            <ogc:PropertyIsEqualTo>
				<ogc:PropertyName>link_id</ogc:PropertyName>
				<ogc:Literal>103087775</ogc:Literal>
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
        
        
        
	     <se:Rule> <!-- Red Layer Breakdown and Accident Icon in Red color-->
            <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">  
                <ogc:Or> 
			<ogc:PropertyIsEqualTo>
                 <ogc:PropertyName>link_id</ogc:PropertyName>
                <ogc:Literal>104009694</ogc:Literal>
              </ogc:PropertyIsEqualTo>
       		<ogc:PropertyIsEqualTo>
                 <ogc:PropertyName>link_id</ogc:PropertyName>
                <ogc:Literal>104009594</ogc:Literal>
              </ogc:PropertyIsEqualTo>
			       		<ogc:PropertyIsEqualTo>
                 <ogc:PropertyName>link_id</ogc:PropertyName>
                <ogc:Literal>103105806</ogc:Literal>
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
        
        <se:Rule> <!-- Unattentive vehicle traffic Area Amber Layer -->
        <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">     
		<ogc:Or>	
          <ogc:PropertyIsEqualTo>
				<ogc:PropertyName>link_id</ogc:PropertyName>
				<ogc:Literal>103103462</ogc:Literal>
			</ogc:PropertyIsEqualTo>
            <ogc:PropertyIsEqualTo>
				<ogc:PropertyName>link_id</ogc:PropertyName>
				<ogc:Literal>103065114</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			            <ogc:PropertyIsEqualTo>
				<ogc:PropertyName>link_id</ogc:PropertyName>
				<ogc:Literal>103064855</ogc:Literal>
			</ogc:PropertyIsEqualTo>
	
        </ogc:Or>
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
        
		  <se:Rule> <!-- Amber Layer traffic speed expressway -->
         <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">   
            <ogc:And> 
			<ogc:PropertyIsEqualTo>
                 <ogc:PropertyName>cat</ogc:PropertyName>
                <ogc:Literal>CATA</ogc:Literal>
              </ogc:PropertyIsEqualTo> 
<ogc:PropertyIsBetween>
          <ogc:PropertyName>date_time</ogc:PropertyName>
          <ogc:LowerBoundary>
            <ogc:Literal>2019-07-18 02:10:00</ogc:Literal>
          </ogc:LowerBoundary>
          <ogc:UpperBoundary>
            <ogc:Literal>2019-07-18 02:15:00</ogc:Literal>
          </ogc:UpperBoundary>
      </ogc:PropertyIsBetween>		  
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
        <se:Rule> <!-- Amber Layer traffic speed NOT a expressway -->
         <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">   
            <ogc:And> 
			<ogc:PropertyIsEqualTo>
                 <ogc:PropertyName>cat</ogc:PropertyName>
                <ogc:Literal>CATB</ogc:Literal>
              </ogc:PropertyIsEqualTo> 
<ogc:PropertyIsBetween>
          <ogc:PropertyName>date_time</ogc:PropertyName>
          <ogc:LowerBoundary>
            <ogc:Literal>2019-07-18 02:10:00</ogc:Literal>
          </ogc:LowerBoundary>
          <ogc:UpperBoundary>
            <ogc:Literal>2019-07-18 02:15:00</ogc:Literal>
          </ogc:UpperBoundary>
      </ogc:PropertyIsBetween>		   	
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
		  
		    <se:Rule> <!-- Green Layer traffic speed expressway -->
         <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">   
            <ogc:And> 
			<ogc:PropertyIsEqualTo>
                 <ogc:PropertyName>cat</ogc:PropertyName>
                <ogc:Literal>CATA</ogc:Literal>
              </ogc:PropertyIsEqualTo> 
			<ogc:PropertyIsBetween>
          <ogc:PropertyName>date_time</ogc:PropertyName>
          <ogc:LowerBoundary>
            <ogc:Literal>2019-07-18 02:10:00</ogc:Literal>
          </ogc:LowerBoundary>
          <ogc:UpperBoundary>
            <ogc:Literal>2019-07-18 02:15:00</ogc:Literal>
          </ogc:UpperBoundary>
      </ogc:PropertyIsBetween>		   	
               <ogc:PropertyIsGreaterThan> 
                <ogc:PropertyName>speed</ogc:PropertyName>
                <ogc:Literal>60</ogc:Literal>
			</ogc:PropertyIsGreaterThan>				
              </ogc:And> 
          </ogc:Filter>         
           <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#1fc600</se:SvgParameter>
              <se:SvgParameter name="stroke-width">3</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer> 
          </se:Rule>
        <se:Rule> <!-- Green Layer traffic speed NOT a expressway -->
         <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">   
            <ogc:And> 
			<ogc:PropertyIsEqualTo>
                 <ogc:PropertyName>cat</ogc:PropertyName>
                <ogc:Literal>CATB</ogc:Literal>
              </ogc:PropertyIsEqualTo> 
	<ogc:PropertyIsBetween>
          <ogc:PropertyName>date_time</ogc:PropertyName>
          <ogc:LowerBoundary>
            <ogc:Literal>2019-07-18 02:10:00</ogc:Literal>
          </ogc:LowerBoundary>
          <ogc:UpperBoundary>
            <ogc:Literal>2019-07-18 02:15:00</ogc:Literal>
          </ogc:UpperBoundary>
      </ogc:PropertyIsBetween>		   	
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
		
        <se:Rule> <!-- traffic speed in red color heavy traffic -->
        <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">     
		<ogc:Or>	
          <ogc:PropertyIsEqualTo>
				<ogc:PropertyName>link_id</ogc:PropertyName>
				<ogc:Literal>103083724</ogc:Literal>
			</ogc:PropertyIsEqualTo>
            <ogc:PropertyIsEqualTo>
				<ogc:PropertyName>link_id</ogc:PropertyName>
				<ogc:Literal>103075536</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<ogc:PropertyIsEqualTo>
				<ogc:PropertyName>link_id</ogc:PropertyName>
				<ogc:Literal>103054312</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<ogc:PropertyIsEqualTo>
				<ogc:PropertyName>link_id</ogc:PropertyName>
				<ogc:Literal>103057096</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<ogc:PropertyIsEqualTo>
				<ogc:PropertyName>link_id</ogc:PropertyName>
				<ogc:Literal>103083716</ogc:Literal>
			</ogc:PropertyIsEqualTo>
            <ogc:PropertyIsEqualTo>
				<ogc:PropertyName>link_id</ogc:PropertyName>
				<ogc:Literal>103083720</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<ogc:PropertyIsEqualTo>
				<ogc:PropertyName>link_id</ogc:PropertyName>
				<ogc:Literal>103077404</ogc:Literal>
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
<se:Rule> <!-- traffic speed in red color heavy traffic Jurong West-->
        <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">     
		<ogc:Or>	
          <ogc:PropertyIsEqualTo>
				<ogc:PropertyName>link_id</ogc:PropertyName>
				<ogc:Literal>103081818</ogc:Literal>
			</ogc:PropertyIsEqualTo>
            <ogc:PropertyIsEqualTo>
				<ogc:PropertyName>link_id</ogc:PropertyName>
				<ogc:Literal>103080535</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<ogc:PropertyIsEqualTo>
				<ogc:PropertyName>link_id</ogc:PropertyName>
				<ogc:Literal>104002982</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<ogc:PropertyIsEqualTo>
				<ogc:PropertyName>link_id</ogc:PropertyName>
				<ogc:Literal>104002986</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<ogc:PropertyIsEqualTo>
				<ogc:PropertyName>link_id</ogc:PropertyName>
				<ogc:Literal>103090415</ogc:Literal>
			</ogc:PropertyIsEqualTo>
            <ogc:PropertyIsEqualTo>
				<ogc:PropertyName>link_id</ogc:PropertyName>
				<ogc:Literal>108001391</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<ogc:PropertyIsEqualTo>
				<ogc:PropertyName>link_id</ogc:PropertyName>
				<ogc:Literal>106001024</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<ogc:PropertyIsEqualTo>
				<ogc:PropertyName>link_id</ogc:PropertyName>
				<ogc:Literal>103085186</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<ogc:PropertyIsEqualTo>
				<ogc:PropertyName>link_id</ogc:PropertyName>
				<ogc:Literal>103085182</ogc:Literal>
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
<se:Rule> <!-- traffic speed in red color heavy traffic Jurong West-->
        <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">     
		<ogc:Or>	
          <ogc:PropertyIsEqualTo>
				<ogc:PropertyName>link_id</ogc:PropertyName>
				<ogc:Literal>103071462</ogc:Literal>
			</ogc:PropertyIsEqualTo>
            <ogc:PropertyIsEqualTo>
				<ogc:PropertyName>link_id</ogc:PropertyName>
				<ogc:Literal>117000444</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<ogc:PropertyIsEqualTo>
				<ogc:PropertyName>link_id</ogc:PropertyName>
				<ogc:Literal>103079759</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<ogc:PropertyIsEqualTo>
				<ogc:PropertyName>link_id</ogc:PropertyName>
				<ogc:Literal>103116482</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<ogc:PropertyIsEqualTo>
				<ogc:PropertyName>link_id</ogc:PropertyName>
				<ogc:Literal>103116478</ogc:Literal>
			</ogc:PropertyIsEqualTo>
            <ogc:PropertyIsEqualTo>
				<ogc:PropertyName>link_id</ogc:PropertyName>
				<ogc:Literal>103078958</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<ogc:PropertyIsEqualTo>
				<ogc:PropertyName>link_id</ogc:PropertyName>
				<ogc:Literal>104002991</ogc:Literal>
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
        
        
<se:Rule> <!-- traffic speed in red color heavy traffic Jurong West-->
        <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">     
		<ogc:Or>	
          <ogc:PropertyIsEqualTo>
				<ogc:PropertyName>link_id</ogc:PropertyName>
				<ogc:Literal>103081343</ogc:Literal>
			</ogc:PropertyIsEqualTo>
            <ogc:PropertyIsEqualTo>
				<ogc:PropertyName>link_id</ogc:PropertyName>
				<ogc:Literal>1030678516</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<ogc:PropertyIsEqualTo>
				<ogc:PropertyName>link_id</ogc:PropertyName>
				<ogc:Literal>103067858</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<ogc:PropertyIsEqualTo>
				<ogc:PropertyName>link_id</ogc:PropertyName>
				<ogc:Literal>103107262</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<ogc:PropertyIsEqualTo>
				<ogc:PropertyName>link_id</ogc:PropertyName>
				<ogc:Literal>103107258</ogc:Literal>
			</ogc:PropertyIsEqualTo>
            <ogc:PropertyIsEqualTo>
				<ogc:PropertyName>link_id</ogc:PropertyName>
				<ogc:Literal>103073638</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<ogc:PropertyIsEqualTo>
				<ogc:PropertyName>link_id</ogc:PropertyName>
				<ogc:Literal>703046968</ogc:Literal>
			</ogc:PropertyIsEqualTo>			
			<ogc:PropertyIsEqualTo>
				<ogc:PropertyName>link_id</ogc:PropertyName>
				<ogc:Literal>103083150</ogc:Literal>
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
<se:Rule> <!-- traffic speed in red color heavy traffic Jurong West-->
        <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">     
		<ogc:Or>	
          <ogc:PropertyIsEqualTo>
				<ogc:PropertyName>link_id</ogc:PropertyName>
				<ogc:Literal>103079284</ogc:Literal>
			</ogc:PropertyIsEqualTo>
            <ogc:PropertyIsEqualTo>
				<ogc:PropertyName>link_id</ogc:PropertyName>
				<ogc:Literal>103083150</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<ogc:PropertyIsEqualTo>
				<ogc:PropertyName>link_id</ogc:PropertyName>
				<ogc:Literal>103081304</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<ogc:PropertyIsEqualTo>
				<ogc:PropertyName>link_id</ogc:PropertyName>
				<ogc:Literal>103079284</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<ogc:PropertyIsEqualTo>
				<ogc:PropertyName>link_id</ogc:PropertyName>
				<ogc:Literal>103073324</ogc:Literal>
			</ogc:PropertyIsEqualTo>
            <ogc:PropertyIsEqualTo>
				<ogc:PropertyName>link_id</ogc:PropertyName>
				<ogc:Literal>103114636</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<ogc:PropertyIsEqualTo>
				<ogc:PropertyName>link_id</ogc:PropertyName>
				<ogc:Literal>103058508</ogc:Literal>
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
        
        
        
        
		  
      </se:FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>