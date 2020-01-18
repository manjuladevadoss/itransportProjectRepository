FROM nginx:1.17.1-alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY bis.itpt.its.com.key /etc/nginx/bis.itpt.its.com.key
COPY bis.itpt.its.com-chain.cert.pem /etc/nginx/bis.itpt.its.com-chain.cert.pem
COPY /dist/* /usr/share/nginx/html/
RUN chmod 777 -R /usr/share/nginx/html/