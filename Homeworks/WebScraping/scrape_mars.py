from bs4 import BeautifulSoup as bs
from splinter import Browser
import pandas as pd
import datetime as dt


def scrape_all():

    browser = Browser("chrome")

    # Get these variable values from function
    news_title, news_p = mars_news(browser)

    # Run all scraping functions and store in dictionary.
    data = {
        "news_title": news_title,
        "news_paragraph": news_p,
        "featured_image": featured_image(browser),
        "hemispheres": hemispheres(browser),
        "weather": mars_weather(browser),
        "facts": mars_facts(),
        "last_modified": dt.datetime.now()
    }

    # Stop webdriver and return data
    browser.quit()
    return data



def mars_news(browser):
    browser.visit('https://mars.nasa.gov/news/')

    # Parse it for news title and news paragraph using Beautiful Soup
    html = browser.html
    news_soup = bs(html, 'html.parser')
    news_title = news_soup.find('div', class_ = 'content_title').get_text()
    news_p = news_soup.find('div', class_ = 'article_teaser_body').get_text()

    return news_title, news_p



def featured_image(browser):
    
    # Visit site
    browser.visit('https://www.jpl.nasa.gov/spaceimages/?search=&category=Mars')

    # Navigate to the correct page with info using splinter browser
    full_image = browser.find_by_id('full_image')
    full_image.click()

    more_info = browser.find_link_by_partial_text('more info')
    more_info.click()

    # Parse it for image using Beautiful Soup
    html = browser.html
    fi_soup = bs(html, 'html.parser')
    featured_image = fi_soup.find('img', class_ = 'main_image')['src']
    featured_image_url = f'https://jpl.nasa.gov{featured_image}'

    return featured_image_url



def mars_weather(browser):
    
    # Visit site
    browser.visit('https://twitter.com/marswxreport?lang=en')

    # Parse it for first tweet's content
    html = browser.html
    weather_soup = bs(html, 'html.parser')
    mars_weather = weather_soup.find(class_='TweetTextSize TweetTextSize--normal js-tweet-text tweet-text').get_text()
    mars_weather

    return mars_weather



def mars_facts():
    # Read the webpage into pandas and grab the second table
    df = pd.read_html('https://space-facts.com/mars/')[1]

    # Rename columns
    df.columns = ['Description', 'Value']

    df.set_index('Description')

    # Add some bootstrap styling to <table>
    return df.to_html(classes="table table-striped")



def hemispheres(browser):

    browser.visit('https://astrogeology.usgs.gov/search/results?q=hemisphere+enhanced&k1=target&v1=Mars')

    # Set up empty list for storing dictionaries
    hemisphere_image_urls = []

    # Set up loop to go through each hemisphere page
    for i in range(4):
        
        # empty dictionary to hold url and title to be scraped
        hemisphere = {}
        
        # Click on the next link in the loop
        browser.find_by_css('a.itemLink.product-item h3')[i].click()
        
        # Grab the href link and store it in the dictionary
        hemisphere['img_url'] = browser.find_link_by_text('Sample').first['href']

        # Grab the title and store it in the dictionary
        hemisphere['title'] = browser.find_by_css('h2.title').text
        
        # Append the dictionary to the list
        hemisphere_image_urls.append(hemisphere)
        
        # Go back in order to repeat the loop
        browser.back()

    return hemisphere_image_urls




if __name__ == "__main__":

    # If running as script, print scraped data
    print(scrape_all())