package main.java.com.config;

import java.util.List;

import org.springframework.context.annotation.Configuration;
import org.springframework.format.FormatterRegistry;
import org.springframework.http.converter.ByteArrayHttpMessageConverter;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.validation.MessageCodesResolver;
import org.springframework.validation.Validator;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.HandlerMethodReturnValueHandler;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.config.annotation.AsyncSupportConfigurer;
import org.springframework.web.servlet.config.annotation.ContentNegotiationConfigurer;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.PathMatchConfigurer;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@EnableWebMvc
public class MvcConfig implements WebMvcConfigurer {

	 @Override
	    public void addResourceHandlers(ResourceHandlerRegistry registry) {
		 registry.addResourceHandler("/documents/**")
         .addResourceLocations("classpath:/uploads/")
         .setCachePeriod(0);
	    }

	    @Override
	    public void configurePathMatch(PathMatchConfigurer configurer) {
	        // Configure path matching options if needed
	    }

	    @Override
	    public void configureViewResolvers(ViewResolverRegistry registry) {
	        // Configure view resolvers if needed
	    }

	    @Override
	    public void addCorsMappings(CorsRegistry registry) {
	        // Configure CORS mappings if needed
	    }

	    @Override
	    public void addInterceptors(InterceptorRegistry registry) {
	        // Register interceptors if needed
	    }

	    @Override
	    public void addArgumentResolvers(List<HandlerMethodArgumentResolver> resolvers) {
	        // Add custom argument resolvers if needed
	    }

	    @Override
	    public void addReturnValueHandlers(List<HandlerMethodReturnValueHandler> handlers) {
	        // Add custom return value handlers if needed
	    }

	    @Override
	    public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
	        // Configure message converters if needed
	        converters.add(new ByteArrayHttpMessageConverter());
	    }

		@Override
		public void configureContentNegotiation(ContentNegotiationConfigurer configurer) {
			// TODO Auto-generated method stub
			
		}

		@Override
		public void configureAsyncSupport(AsyncSupportConfigurer configurer) {
			// TODO Auto-generated method stub
			
		}

		@Override
		public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
			// TODO Auto-generated method stub
			
		}

		@Override
		public void addFormatters(FormatterRegistry registry) {
			// TODO Auto-generated method stub
			
		}

		@Override
		public void addViewControllers(ViewControllerRegistry registry) {
			// TODO Auto-generated method stub
			
		}

		@Override
		public void extendMessageConverters(List<HttpMessageConverter<?>> converters) {
			// TODO Auto-generated method stub
			
		}

		@Override
		public void configureHandlerExceptionResolvers(List<HandlerExceptionResolver> exceptionResolvers) {
			// TODO Auto-generated method stub
			
		}

		@Override
		public void extendHandlerExceptionResolvers(List<HandlerExceptionResolver> exceptionResolvers) {
			// TODO Auto-generated method stub
			
		}

		@Override
		public Validator getValidator() {
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public MessageCodesResolver getMessageCodesResolver() {
			// TODO Auto-generated method stub
			return null;
		}

	    // Implement other methods as needed...


}